$newPuppet = Get-WmiObject Win32_Product | where { $_.name -Like "Puppet*" -and $_.Version -Like '5.5.*' }
if (! $newPuppet) {
  Remove-Item -ErrorAction SilentlyContinue -Recurse -Force C:\ProgramData\PuppetLabs
  Invoke-WebRequest https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.17-x64.msi -OutFile 'C:\puppet-agent.msi' -UseBasicParsing
  Start-Process -Wait -FilePath msiexec -ArgumentList /qn, /norestart, /i, C:\puppet-agent.msi, PUPPET_MASTER_SERVER=5.puppet.lrscorp.net, PUPPET_AGENT_STARTUP_MODE=Disabled
  Remove-Item 'C:\puppet-agent.msi' -ErrorAction SilentlyContinue
  puppet agent -t --environment workstation --noop
}