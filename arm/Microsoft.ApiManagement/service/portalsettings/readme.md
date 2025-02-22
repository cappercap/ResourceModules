# API Management Service Portal Settings `[Microsoft.ApiManagement/service/portalsettings]`

This module deploys API Management Service Portal Setting.

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.ApiManagement/service/portalsettings` | 2019-12-01 |

## Parameters

| Parameter Name | Type | Default Value | Possible Values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `apiManagementServiceName` | string |  |  | Required. The name of the of the API Management service. |
| `cuaId` | string |  |  | Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered |
| `name` | string |  | `[delegation, signin, signup]` | Required. Portal setting name |
| `properties` | object | `{object}` |  | Optional. Portal setting properties. |

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `portalSettingsName` | string | The name of the API management service portal setting |
| `portalSettingsResourceGroup` | string | The resource group the API management service portal setting was deployed into |
| `portalSettingsResourceId` | string | The resource ID of the API management service portal setting |

## Template references

- [Service/Portalsettings](https://docs.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2019-12-01/service/portalsettings)
