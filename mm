Practical No: 11 A] Migrating Virtual Machines
B] Managing Virtual Machines


A] Migrating Virtual Machines:

Objective: Use vSphere vMotion and vSphere Storage In this lab, you perform the following tasks: vMotion to migrate virtual machines

1. Migrate Virtual Machine Files from the Local Storage to the Shared Storage 
2. Create a Virtual Switch and a VMkernel Port Group for vSphere vMotion Migration 
3. Perform a vSphere vMotion Migration of a Virtual Machine on a Shared Datastore 
4. Perform a Compute Resource and Storage Migration

1: Migrate Virtual Machine Files from the Local Storage to the Shared Storage

1. If vSphere Web Client is not active, open your Internet Explorer Web browser, click vSphere Web Client on the favorite bar, and select vSphere Web Client - sa-vcsa-01.vclass.local.
2. When the There is a problem with this website’s security certificate warning message appears, click Continue to this website (not recommended)
3. Log in using administrator@vsphere.local as the user name and standard lab password. 
4. On the vSphere Web Client Home page, click VMs and Templates and expand the view of the inventory.
5. If the VM2-1 virtual machine is not powered on, right-click the VM2-1 virtual machine and select Power > Power On. 
6. Select the VM2-1 virtual machine in the inventory and click the Summary tab
7. Expand the Related Objects pane and record the name of the storage on which the VM2-1 virtual machine resides. ___
 8. In the inventory, right-click the VM2-1 virtual machine and select Migrate. The Migrate wizard starts. 
9. On the Select the migration type page, click Change storage only and click Next. 
10. On the Select storage page, select Shared-iSCSI-Datastore as the destination storage for the virtual machine files. In the Compatibility pane, the Compatibility checks succeeded message appears. 
11. If the compatibility checks fail, troubleshoot the problem based on the message in the Compatibility pane. 
12. Click Next. 
13. On the Ready to complete page, review the information and click Finish. 
14. Monitor the Recent Tasks pane and wait for the virtual machine files relocation process to complete. This task takes a few minutes. 
15. Repeat steps 6 through 7 to verify that the VM2-1 virtual machine is on the new datastore, which is the Shared-iSCSI-Datastore.

2: Create a Virtual Switch and a VMkernel Port Group for vSphere vMotion Migration

1. In the left pane of vSphere Web Client, click the Hosts and Clusters tab. 
2. Select the host sa-esxi-01.vclass.local in the inventory. 
3. Click the Configure tab. 4. Select Virtual switches under Networking in the middle pane. 
5. Click the Add Host Networking icon. The Add Networking wizard starts. 
6. On the Select connection type page, click VMkernel Network Adapter and click Next. 
7. On the Select target device page, click New standard switch and click Next
8. On the Create a Standard Switch page, click the green + sign to add a physical adapter to the switch
9. Select vmnic2 as the vmnic for the vSphere vMotion network and click OK. 
10. Review the information shown and click Next
11. On the Port properties page for connection settings, enter vMotion in the Network label text box. 
12. Select the vMotion check box, and click Next. 
13. On the IPv4 settings page, click Use static IPv4 settings. 
14. Enter 172.20.12.51 in the IPv4 address text box for sa-esxi-01. 1
5. Enter 255.255.255.0 in the Subnet mask text box for the vMotion VMkernel port IPv4. 
16. Click Next. 
17. On the Ready to complete page, review the information and click Finish. 
18. In the Virtual Switches pane, verify that the new virtual switch for vSphere vMotion migration is listed.
19. Repeat task 2 for sa-esxi-02.vclass.local using the vMotion VMkernel port IPv4 address for sa-esxi-02 as 172.20.12.52. All other steps remain same

3: Perform a vSphere vMotion Migration of a Virtual Machine on a Shared Datastore 
1. In the vSphere Web Client Navigator pane, click the Hosts and Clusters tab and expand the view of the inventory. 
2. Click the arrow next to sa-esxi-01.vclass.local to expand the view. 
3. Right-click the VM1-2 virtual machine and select Edit Settings. 
4. On the Virtual Hardware tab, select Client Device from the CD/DVD drive 1 drop-down menu if it is not already selected
5. Click the arrow next to Network adapter 1 to expand the view. 
6. Verify that Production is selected from the drop-down menu. 
7. Ensure that the Connect At Power On check box is selected. 
8. Click OK. 
9. Repeat steps 3 through 8 for all the virtual machines. 
10. If the VM1-2 virtual machine is powered-off, right-click the virtual machine and select Power > Power On.
11. Right-click the VM1-2 virtual machine and select Open Console. 
12. Log in with the user name admin and the standard lab password. 
13. Click the Start menu. 
14. In the search box, enter cmd and press Enter to open a Command Prompt window. 
15. When the Command Prompt window opens, enter the ipconfig command and record the virtual machine’s default gateway IP address. _ 
16. Enter ping -t default_gateway IP address on the command line and press Enter start a continuous ping. 
17. Leave the virtual machine console open and return to vSphere Web Client. 
18. Migrate the VM1-2 virtual machine from host sa-esxi-01.vclass.local to host sa-esxi-02.vclass.local.
a. In the vSphere Web Client inventory, right-click the VM1-2 virtual machine and select Migrate.
 b. On the Select the migration type page, click Change compute resource only and click Next. 
c. On the Select a compute resource page, click sa-esxi-02.vclass.local. sa-esxi-02.vclass.local is the destination host to which you migrate the VM1-2 virtual machine. The migration requirements are validated. If the validation does not succeed, you receive warning or error messages. You cannot continue with the migration until the errors are resolved. 
d. Click Next. 
e. On the Select networks page, ensure that Production is selected from the Destination Network drop-down menu and click Next.
f. On the Select vMotion priority page, leave Schedule vMotion with high priority (recommended) clicked and click Next. 
g. On the Ready to complete page, review the information and click Finish.
19. If VM1-2 virtual machine console is disconnected, reopen the console. 
20. Return to the VM1-2 virtual machine console and monitor that no pings are dropped during the migration. 
21. Press Ctrl+C to stop the ping.
22. Close the C:\Windows\system32\cmd.exe console. 
23. Close the VM1-2 virtual machine console. 
24. If your VM2-2 virtual machine is not powered on, right-click VM2-2 and select Power > Power On. 
25. Select VM2-2 from the left pane and click the Summary tab.
 26. Ensure that VM2-2 is on host sa-esxi-02.vclass.local. 
27. In the left pane, drag the VM2-2 virtual machine from sa-esxi-02.vclass.local to sa-esxi01.vclass.local. The Migrate wizard appears. 
28. On the Select the migration type page, click Change compute resource only and click Next. 
29. On the Select a compute resource page, ensure that sa-esxi-01.vclass.local is selected and click Next. 
30. On the Select network page, ensure that Production is selected from the Destination Network drop-down menu and click Next. 
31. On the Select vMotion priority page, leave Schedule vMotion with high priority (recommended) clicked and click Next.
 32. On the Ready to complete page, review the information and click Finish. 33. When the migration tasks are completed, view the inventory pane to verify that VM1-2 is under sa-esxi-02.vclass.local and VM2-2 is under sa-esxi-01.vclass.local.

4: Perform a Compute Resource and Storage Migration
1. In the inventory, right-click the VM-FromLib virtual machine and select Migrate. 
2. On the Select the migration type page, click Change both compute resource and storage. 3. Accept the Select compute resource first default setting and click Next. 
4. On the Select compute resource page, expand Datacenter and select Lab Servers > sa-esxi01.vclass.local.
5. Click Next. 
6. On the Select storage page, select Local01-2 and click Next. 
7. On the Select network page, ensure that Production is selected from the Destination Network drop-down menu and click Next. 
8. On the Select vMotion priority page, leave Schedule vMotion with high priority (recommended) clicked and click Next. 
9. On the Ready to complete page, review the information and click Finish. 
10. In the Recent Tasks pane, monitor the progress of the virtual machine migration. This process takes approximately five minutes. 
11. When the migration task is completed, view the inventory pane to verify that the VM-FromLib virtual machine is listed under your sa-esxi-01.vclass.local ESXi host in the inventory. 
12. Right-click VM-FromLib and select Power > Shut Down Guest OS.
Managing Virtual Machines

Objective: Perform virtual machine management tasks

1. Unregister a Virtual Machine from the vCenter Server Appliance Inventory 
2. Register a Virtual Machine in the vCenter Server Appliance Inventory 
3. Unregister and Delete Virtual Machines from the Datastore 
4. Take Snapshots of a Virtual Machine 
5. Revert the Virtual Machine to a Snapshot 
6. Delete an Individual Snapshot 7. Delete All Snapshots
1: Unregister a Virtual Machine from the vCenter Server Appliance Inventory

1. If vSphere Web Client is not active, open your Internet Explorer Web browser, click vSphere Web Client on the favorite bar, and select vSphere Web Client - sa-vcsa-01.vclass.local. 
2. When the There is a problem with this website’s security certificate warning message appears, click Continue to this website (not recommended). 
3. Log in using administrator@vsphere.local as the user name and standard lab password. 
4. On the vSphere Web Client Home page, click VMs and Templates and expand the view of the inventory. 
5. Select theVM2-3 virtual machine and click the Datastores tab.
6. Record the VMware vSphere® VMFS datastore name where theVM2-3 virtual machine resides. __ 7. If the VM2-3 virtual machine is powered on, right-click VM2-3, select Power > Shut Down Guest OS, and click Yes to confirm the shutdown
8. Right-click VM2-3 and select Remove from Inventory
9. Click Yes to confirm the removal. 
10. Click the Refresh icon in vSphere Web Client. 
11. Verify that theVM2-3 virtual machine no longer appears in the inventory. 
12. In the Navigator pane, click the Storage icon and expand the view. 
13. Right-click the datastore name that you recorded in step 6 and select Browse Files. 
14. View the folders
15. Click the Hot-Clone folder to view the virtual machine files.

2: Register a Virtual Machine in the vCenter Server Appliance Inventory
1. In the list of virtual machine files in the right pane, right-click the Hot-Clone.vmx file and select Register VM
2. On the Name and Location page, enter VM2-3. 
3. In the Select inventory location pane, expand Datacenter, select the LabVMs folder, and click Next. 4. On the Host/Cluster page, expand the Lab Servers folder under Datacenter. 
5. Select sa-esxi-01.vclass.local and click Next. 
6. On the Ready to Complete page, review the information and click Finish. 
7. In the Navigator pane, click the VMs and Templates icon and verify that the VM2-3 virtual machine is in the LabVMs folder.

3: Unregister and Delete Virtual Machines from the Datastore
1. On the vSphere Web Client Home page, click VMs and Templates and expand the view of the inventory. 
2. Select the VM2-3 virtual machine from the inventory and click the Datastores tab. 
3. Record the VMFS datastore name on which the VM2-3 virtual machine resides. _ 
4. Right-click the VM2-3 virtual machine from the inventory, select Delete from Disk, and click Yes to confirm the deletion.
5. Verify that the VM2-3 virtual machine no longer appears in the inventory. 
6. In the Navigator pane, click the Storage icon and expand the inventory view. 
7. In the Navigator pane, right-click the datastore that you recorded in step 3 and select Browse Files. 8. Verify that the folder and files from which the VM2-3 virtual machine was registered no longer exist. 
9. In the Navigator pane, click the VMs and Templates icon. 
10. Right-click the VM-FromLib virtual machine, select Delete from Disk, and click Yes to confirm the deletion.

4: Take Snapshots of a Virtual Machine

1. On the vSphere Web Client Home page, click VMs and Templates and expand the view of the inventory. 
2. In the left pane, right-click the VM1-2 virtual machine and select Open Console. 
3. Login as admin with the standard lab password. 
4. From the desktop, drag the IOMETER file to the Recycle Bin. 
5. Right-click the Recycle Bin icon and select Empty Recycle Bin to delete the IOMETER file permanently. 
6. Click Yes to confirm the file deletion and leave the virtual machine console open
7. In vSphere Web Client, right-click the VM1-2 virtual machine and select Snapshots > Take Snapshot. 
The Take VM Snapshot wizard appears
9. Click OK and monitor the task in the Recent Tasks pane. 
10. Return to the virtual machine console and drag the CPUBUSY file to the Recycle Bin. 
11. Right-click the Recycle Bin icon and select Empty Recycle Bin to delete the CPUBUSY file permanently. 
12. Click Yes to confirm the file deletion and leave the virtual machine console open. 
13. Return to vSphere Web Client. 
14. In the inventory pane, right-click the VM1-2 virtual machine and select Snapshots > Take Snapshot take another snapshot.
16. Click OK and monitor the task in the Recent Tasks pane.
17. Connect the ClassFiles-vSphere.iso file on the CD/DVD drive to the VM1-2 virtual machine.
a. Right-click the VM1-2 virtual machine and select Edit Settings. 
b. On the Virtual Hardware tab, select Datastore ISO File from the CD/DVD drive 1 drop-down menu. 
c. In the left pane, select Local02-2/. 
d. In the middle pane, select the Classfiles-vSphere.iso file. 
e. Click OK. f. Select the Connected check box on the CD/DVD drive 1 row. 
g. Click OK to close the Edit Settings dialog box
18. Return to the VM1-2 virtual machine console. 
The DVD drive AutoPlay window should appear
19. If the D: drive does not open automatically, open Windows Explorer and go to the D: drive. 
20. Click Open folder to view files. 
21. Copy the CPUBUSY file from the D: drive to the virtual machine’s desktop. 
22. Disconnect the CD/DVD drive from VM1-2 virtual machine. 
a. From vSphere Web Client, right-click the VM1-2 virtual machine and select Edit Settings. 
b. On the Virtual Hardware tab, click the arrow next to CD/DVD drive 1 to expand the view. 
c. Select Client Device from the drop-down menu and click OK. 
23. Right-click the VM1-2 virtual machine and select Snapshots > Take Snapshot to take another snapshot
24. Configure the snapshot
25. Click OK. 
26. Monitor the task in the Recent Tasks pane and wait for completion. 
This task takes slightly longer than previous snapshots because the guest memory is also being saved. 
27. Right-click the VM1-2 virtual machine and select Snapshots > Manage Snapshots. 
28. Leave the Snapshots tab open. 
29. Close the VM1-2 virtual machine console

5: Revert the Virtual Machine to a Snapshot
1. On the Snapshots tab, select the Without iometer or cpubusy snapshot, click All Actions, and select Revert to. 
2. Click Yes to confirm the revert
3. Right-click the VM1-2 virtual machine in the inventory and select Power > Power On. 
4. Right-click VM1-2 in the Navigator pane and select Open Console. Wait for the boot process to complete. 5. Log in as admin with the standard lab password.
6. Close the VM1-2 virtual machine console. 
7. In vSphere Web Client, right-click the VM1-2 virtual machine and select Snapshots > Manage Snapshots.
8. On the Snapshots tab, select the With cpubusy snapshot, click All Actions, and select Revert to.
9. Leave the Suspend this virtual machine when reverting to selected snapshot check box deselected and click Yes to confirm the revert operation
10. Open a console for the VM1-2 virtual machine

6: Delete an Individual Snapshot
1. Return to vSphere Web Client, ensure that VM1-2 is selected in the Navigator pane, and verify that the Snapshots tab is open.
2. Select the Without iometer or cpubusy snapshot and click the delete icon
3. Click Yes to confirm the deletion
7: Delete All Snapshots
1. Under VMs and Templates in vSphere Web Client, right-click the VM1-2 virtual machine in the Navigator pane and select Snapshots > Delete All Snapshots. 
2. Click Yes to confirm that you want to delete all the remaining snapshots. Only the You are here pointer should appear on the snapshots tab
3. Return to the VM1-2 virtual machine console.
4. Close the VM1-2 virtual machine console. 
5. Leave vSphere Web Client open for the next lab.
