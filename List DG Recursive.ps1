function Get-DistributionGroupMemberRecursive ($GroupIdentity) {
	$member_list = Get-DistributionGroupMember -Identity $GroupIdentity
	foreach ($member in $member_list) {
		if ($member.RecipientType -like '*Group*') {
			Get-DistributionGroupMemberRecursive -GroupIdentity $member.Identity
		} else {
			$member
		}
	}
}

$group = Get-DistributionGroup "Faithlife Employees"
Get-DistributionGroupMemberRecursive -GroupIdentity $group.Identity