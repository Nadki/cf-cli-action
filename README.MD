# CF CLI Action

Use Cloud Foundry CLI with this action.

## Usage

To use this action, add it to your GitHub Workflow and set the following parameters:

|  Parameter |                    Descriptio                   |
|:----------:|:-----------------------------------------------:|
| cf_package | The name of the apt package name for the CF CLI |
|   cf_api   |          The Cloud Foundry API endpoint         |
|   cf_user  |        The user name/email used for login       |
|   cf_pwd   |         The user password used for login        |
|   cf_org   |          The Cloud Foundry Organization         |
|  cf_space  |             The Cloud Foundry Space             |
| cf_command |   The command passed to CF-CLI, omit the "cf"   |

## Example

Below is an example of how to set a GitHub workflow that uses this action. In this case we're listing all apps on the specified space.

```yaml
name: do-stuff-in-cf
on:
  workflow_dispatch:
jobs:
  do-stuff:
    runs-on: ubuntu-latest
    steps:
      - name: do-stuff
        id: dostuff
        uses: Nadki/cf-cli-action.git@v1.0.0
        with:
          package_name: ***
          cf_api: ***
          cf_user: ***
          cf_pwd: ***
          cf_org: ***
          cf_space: ***
          cf_command: apps
```
