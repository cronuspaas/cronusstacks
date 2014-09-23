To build the application

1. cd helloworld
2. mvn package

After successfully run the maven task, the generated war file should be copied to build_cronus/wars directory ready for packaging and deployment

To build the deployable cronus package

1. cd build_cronus
2. ./package . helloworld 0.0.1 x86_ubuntu

Finished cronus package in target/helloworld-0.0.1.x86_ubuntu.cronus and ...cronus.prop

To deploy the cronus package

Use cronus master or agent restful API directly to deploy the cronus package to target machine

Additional Info

To generate web project through maven archtype plugin
    mvn archetype:generate -DgroupId=org.example\
     -DartifactId=helloworld\
     -DarchetypeArtifactId=maven-archetype-webapp\
     -DinteractiveMode=false

To use upstart daemon to keep the application always running
    1. create {your_service_name}.conf in .../cronus/
    2. write startup and shutdown script in a way to handle with or without upstart daemon
    3. pass "upstartService={your_service_name}" as part of agent API payload

To use deployment time metadata to decide the application configuration
    1. package all flavor of application configuration file with the naming convention your_app_config.{metadata_value}, e.g. helloworld.properties.qa and helloworld.properties.prod
    2. define in application cronus.ini the mapping between metadata name and list of configurations that need customization, e.g. {"cfgFileMap": "lcm_meta.cos", "cfgFiles": ["container_runtime/webapps/helloworld/WEB-INF/classes/helloworld.properties"]
    3. pass "cos={your_cos_value}" as part of agent API payload 
