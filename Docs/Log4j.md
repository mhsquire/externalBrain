##Log4j System Properties

###Intellij:
To add the system property to intellij 

In InteliJ goto "Run"->"Edit Configurations" In the new window, right panel, open the Junit and click on your test. Now, in the middle click on the "Configuration" tab and update the "VM options"

Add -Dlog4j.configurationFile="log4j2-test.json" to the VM options field. Finally, jackson must be imported.

Note that you will need to do this for every test class, but you can remove all the test from the junit in the right panel and update it in the "Defaults"

Make sure the java Jackson library is installed or Log4j will ignore the log4j2-test.json file and treat it as XML. Then make sure that the library is defined in the project. This should be done by gradle automatically.

If you have to run numerous tests individually, it would be a hassle to have to define the property for each test. What you can do is to go to Run -> Edit Configurations -> Defaults -> JUnit; now add that property there to the VM options. Now every junit test you run will have that property defined. Make sure to remove the default when you move on from that project.

