import json, socket, subprocess, urllib.request
import cortex.serverless  # MUST be imported AFTER the libraries above so the
                          # agent can hook them (subprocess, sockets, etc.)


def run(action):
    if action == "process":
        out = subprocess.run(["/bin/cat", "/etc/hostname"],
                             capture_output=True, text=True, timeout=10)
        return {"action": action, "rc": out.returncode,
                "process": "cat", "output": out.stdout.strip()}
    if action == "listen":
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        s.bind(("0.0.0.0", 7000))
        s.listen(1)
        s.close()
        return {"action": action, "result": "opened listener on tcp/7000"}
    if action == "outbound-port":
        s = socket.create_connection(("portquiz.net", 7000), timeout=6)
        s.close()
        return {"action": action,
                "result": "connected out to portquiz.net:7000"}
    if action == "outbound-ip":
        s = socket.create_connection(("8.8.8.8", 53), timeout=6)
        s.close()
        return {"action": action, "result": "connected out to 8.8.8.8:53"}
    if action == "domain":
        req = urllib.request.Request("https://www.google.com",
                                     headers={"User-Agent": "lab"})
        with urllib.request.urlopen(req, timeout=8) as r:
            return {"action": action, "http_status": r.status,
                    "result": "reached google.com"}
    return {"action": "none",
            "usage": "add ?action=process | listen | outbound-port"
                     " | outbound-ip | domain"}


@cortex.serverless.handler
def handler(event, context):
    qs = (event.get("queryStringParameters") or {})
    action = qs.get("action", "")
    try:
        body = run(action)
        body["blocked"] = False
    except Exception as e:
        body = {"action": action, "blocked_or_failed": True,
                "error": "%s: %s" % (type(e).__name__, e)}
    return {"statusCode": 200,
            "headers": {"Content-Type": "application/json"},
            "body": json.dumps(body)}
