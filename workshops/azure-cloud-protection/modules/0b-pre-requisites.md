


Based on the Palo Alto Networks documentation for required Cortex resources, here are the extracted Fully Qualified Domain Names (FQDNs), categorized by their function. 

### Management & Tenant Access
* **`<tenant-name>.xdr.<region>.paloaltonetworks.com`** *(Used to connect directly to the Cortex tenant console)*

### Agent Registration & Communication
* **`ch-<tenant-name>.traps.paloaltonetworks.com`** *(Used for the first request in the registration flow where the agent passes the distribution ID, and for API requests/responses)*
* **`dc-<tenant-name>.traps.paloaltonetworks.com`** *(Used for EDR data uploads and all other requests between the agent and its tenant server, including heartbeats, uploads, action results, and scan reports)*

### Storage, Updates, & Live Terminal
* **`distributions.traps.paloaltonetworks.com`** *(Used for distribution routing/registration)*
* **`panw-xdr-installers-prod-us.storage.googleapis.com`** *(Storage bucket used to download installers for upgrade actions)*
* **`global-content-profiles-policy.storage.googleapis.com`** *(Storage bucket used to download content updates)*
* **`panw-xdr-payloads-prod-us.storage.googleapis.com`** *(Storage bucket used to download the executable for Live Terminal)*
* **`panw-xdr-evr-prod-<region>.storage.googleapis.com`** *(Used to download extended verdict request results in scanning)*

### Container Registries
* **Regional Docker Registry URL** *(Used to download the Kubernetes image from the registry for Kubernetes agent installations. The exact FQDN depends on your specific tenant location and corresponding Docker registry mapping).*

### Time Synchronization (NTP)
* **`time.google.com`**
* **`pool.ntp.org`**

***

### Technical Context & Requirements

* **Traffic Direction:** You must enable access from the Cortex Agent to the tenant/console (**Outbound**). This network traffic does not need to be bidirectional. 
* **SSL Decryption Exclusions:** If your firewall utilizes SSL decryption, it can cause connection failures between the Cortex agent and the server. It is strictly recommended to add the FQDNs listed above to your **SSL Decryption Exclusion list** (e.g., *Device → Certificate Management → SSL Decryption Exclusion* in PAN-OS).
* **IP Addresses:** Numerical IP addresses, GCP subnets (`goog.json` / `cloud.json`), and region-specific data-out IPs have been intentionally excluded from this list. Specific IPs and regional variations can be obtained directly from the source documentation tables.


REFERENCE:
* https://docs-cortex.paloaltonetworks.com/r/Cortex-CLOUD/Cortex-Cloud-Posture-Management-Documentation/Enable-access-to-required-PANW-resources