## psbootcamp

### List of Scripts to kick start the PS :
***
#### File System  

  * Create a folder in temp, create a log file name it, add a line with date as a prefix.
  * Create a list of all exe files in c:\windows\system32  
  * Create a table showing the drive utilisation in percentage, drive letter. Output into a csv file.
  * Get the list of files in each user's appdata which are older that 3 days. output in a text file.
  * Create a list of all GUIDs of installed applications in a table.
  * List of SID's of each users profile.
  
#### OS and Network
  
  * List of OS properties i.e. version, hostname, domain if part of a domain (If not should report somewhere). output in an HTML report which is presentable to stakeholders.
  
  * Get the details of Bios and NIC. ipaddress etc.
  * Fetch the configuration details of internet properties (inetcpl.cpl).
  * List of all services runnning in an HTML report. show RED in services not running, GREEN if un and running. error handelling
  * List of target services of multiple servers from a list including their corresporing exe's with path.
  * List of all patches installed (kb articless) sorted with date, newer to older.
  * get the list of all windows features and roles assigned to a windows server in csv.
  * Read a dummy INI file, read its content and create another INI files which already have some other contents.
  * Read the Office 365 install and config xml file and report it in a table.(Search internet for the config xml)
  * find out the OU of the test machine where you execute the script. (without ad module)
  * zip the content of all the files in folder and save it on a DFS share.
  * Get/Set the file permissions (ACLs) of any target folder. (Expectation to create two functions if needed based on the output)

#### AD

  * List the members of domain group.
  * List the value of an extension atribute of list of domain users.
  * Create bulk users in a target OU and add each of these in respective Ad groups based on their dept, input from an excel file.
  * Create DFS share in Ad and set few initial permissions and atributes.
  * Script to join domain.
  * Fetch rsop detail of a target server.

#### IIS
  * Install and configure an IIS website with a temp index.html and access URL through internet. (Use Cloud instance to get public ip )
  * Get the list of all published websited from a list of servers.
  * fetch and install target windows features.
