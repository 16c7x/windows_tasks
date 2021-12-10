# windows_tasks

This module contains 2 tasks and 1 plan, the aim is to represent a possible workflow that collects a password from hiera on a PE server and uses that password on a Windows machine without the password being exposed.

The following is an example to test the running of the plan from the command line of the PE server. The following parameters will need updating.  

* ```puppet_host``` The PS servers hostname.
* ```windows_host``` The targewt Windows machine.
* ```hierakey``` The parameter to lookup from hiera.
* ```environment``` The code environment where the parameter exists.

```puppet plan run windows_tasks::ad_task puppet_host=puppet.classroom.puppet.com windows_host=axa6win0.classroom.puppet.com hierakey=message environment=production```

# ad_task plan
The plan accepts the 4 parameters listed above, it runs the get_password plan on the ```puppet_host```, passing in the parameters ```hierakey``` and ```environment``` to retrieve the password securely without exposing it to the console.
It then passes the password into the ad_join task which is then run on the ```windows_host```. To simulate something happening this task writes the password out to ```C:\Users\Administrator\file.txt```. 
