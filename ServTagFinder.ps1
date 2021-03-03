#This variable is loaded with any computer name in our active directory network that begins with "WS"
$computers = (Get-AdComputer -Filter "name -like 'WS2*'").Name
#This for loop actually creates the variable "computer" and then specefies that each computer within AD should run the following command
foreach ($Computer in $Computers)
{
#This command pulls the Computer Variable which is essentialy the WS#, and then queries for the serial number
#Dell machines provide the Service Tag value for this query. This is then piped to append the output into a text file at ther desired path
    wmic /node:$Computer csproduct get identifyingnumber| Add-Content -Path C:\ServTagLog.txt 
#This command simply echo's the WS#/Computer Variable and appends it to the same text file
    echo "$Computer"|Add-Content -Path C:\ServTagLog.txt
}
#The Loops ends here, if there is another WS# available it repeats. 
#If The computer is not networked connected or does not have an valid value, only the WS# is appended.
