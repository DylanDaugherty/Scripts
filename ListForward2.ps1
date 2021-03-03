$RecipientCN = (get-recipient matthew.boffey@faithlife.com).Identity
get-mailbox -ResultSize Unlimited| Where-Object { $_.ForwardingAddress -eq $RecipientCN }