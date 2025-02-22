@description('Required. The name of the Security Alert Policy.')
param name string

@description('Optional. Specifies an array of alerts that are disabled. Allowed values are: Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action, Brute_Force.')
param disabledAlerts array = []

@description('Optional. Specifies that the alert is sent to the account administrators.')
param emailAccountAdmins bool = false

@description('Optional. Specifies an array of email addresses to which the alert is sent.')
param emailAddresses array = []

@description('Optional. Specifies the number of days to keep in the Threat Detection audit logs.')
param retentionDays int = 0

@description('Optional. Specifies the state of the policy, whether it is enabled or disabled or a policy has not been applied yet on the specific database.')
@allowed([
  'Disabled'
  'Enabled'
])
param state string = 'Disabled'

@description('Optional. Specifies the identifier key of the Threat Detection audit storage account..')
@secure()
param storageAccountAccessKey string = ''

@description('Optional. Specifies the blob storage endpoint (e.g. https://MyAccount.blob.core.windows.net). This blob storage will hold all Threat Detection audit logs.')
param storageEndpoint string = ''

@description('Required. The Name of SQL Server')
param serverName string

@description('Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered')
param cuaId string = ''

module pid_cuaId '.bicep/nested_cuaId.bicep' = if (!empty(cuaId)) {
  name: 'pid-${cuaId}'
  params: {}
}

resource server 'Microsoft.Sql/servers@2021-05-01-preview' existing = {
  name: serverName
}

resource securityAlertPolicy 'Microsoft.Sql/servers/securityAlertPolicies@2021-05-01-preview' = {
  name: name
  parent: server
  properties: {
    disabledAlerts: disabledAlerts
    emailAccountAdmins: emailAccountAdmins
    emailAddresses: emailAddresses
    retentionDays: retentionDays
    state: state
    storageAccountAccessKey: empty(storageAccountAccessKey) ? null : storageAccountAccessKey
    storageEndpoint: empty(storageEndpoint) ? null : storageEndpoint
  }
}

@description('The name of the deployed security alert policy')
output databaseName string = securityAlertPolicy.name

@description('The resourceId of the deployed security alert policy')
output databaseId string = securityAlertPolicy.id

@description('The resourceGroup of the deployed security alert policy')
output databaseResourceGroup string = resourceGroup().name
