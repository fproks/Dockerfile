# CONTAIN
 FROM ubuntu, contain java8  maven firefox chrome xvfb!
# HOW TO USE IT
1. download **JDK**、 **MAVEN**、 **geckodriver** 、**chromedriver**

    action the version,must fix the version in the **Dockerfile**  with your version
2.  build the images:

        docker build -t linhos/jfcu .
3. Before start to use this images, don't forget to run xvfb service:

        /etc/init.d/xvfb start

