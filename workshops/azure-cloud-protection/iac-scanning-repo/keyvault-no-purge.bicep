// Intentionally misconfigured — Key Vault without purge protection
param location string = resourceGroup().location
param keyVaultName string = 'cortex-lab-kv-nopurge'

resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    enablePurgeProtection: null // Should be true
    enableSoftDelete: false     // Should be true
    accessPolicies: []
  }
}
