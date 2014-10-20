------------------------- Week 8 Assignment - Saheli Kar ---------------------
--1. Perform an Environmental Scan. Identify a favorite blog that has comments and tags enabled. 
-- Spend a few minutes looking at the site, and think about how posts, comments, and tags are related. 
-- Deliverable: URL of a favorite blog (or other type of site) that implements posts, comments, and tags.

-- The website on which I close to work on is : http://www.vogella.com/

--3. Implement the Physical Database. Implement the database that you designed in step 1. Here, your deliverable is the script that creates the tables.

-- Also includes the challenge portion. Implement some server side referential integrity. Example: foreign key relationships, unique indexes, etc. 
-- For this assignment, you don’t need to be “comprehensive.” You may find that you’ll need to re-write your script in Part 4 above, because the order in which you enter rows matters when foreign key relationships are implemented.

--drop table JAVABlogs;
create table JAVABlogs(
BlogId varchar(10),
BlogName varchar(100) NOT NULL,
URL varchar(500) UNIQUE NOT NULL,
about bytea,
ContactUs varchar(3000),
Primary key(BlogId)
);

--drop table CategoryTable;
create table CategoryTable(
CategoryId varchar(10),
BlogId varchar(10),
CategoryName varchar(100) NOT NULL,
CategoryURL varchar(500) UNIQUE NOT NULL,
Details bytea,
Primary key(CategoryId),
FOREIGN KEY (BlogId) References JAVABlogs(BlogId)
);


--drop table SubCategoryTable;
create table SubCategoryTable(
SubCategoryId varchar(10),
CategoryId varchar(10),
SubCategoryName varchar(100) NOT NULL,
SubCategoryURL varchar(500) UNIQUE NOT NULL,
Details bytea,
PRIMARY KEY(SubCategoryId),
FOREIGN KEY (CategoryId) references CategoryTable(CategoryId)
);

--drop table TopicTable;
create table TopicTable(
TopicId varchar(10),
SubCategoryId varchar(10),
TopicHeader varchar(500),
TopicURL varchar(500),
Details bytea,
PRIMARY KEY(TopicId),
FOREIGN KEY (SubCategoryId) references SubCategoryTable(SubCategoryId)
);


--drop table SubTopic;
create table SubTopic (
SubTopicId varchar(10),
TopicId varchar(10),
SubTopicHeader varchar(200),
SubTopicURL varchar (500),
Details bytea,
PRIMARY KEY(SubTopicId),
FOREIGN KEY (TopicId) references TopicTable(TopicId)
);



-- 4.Populate the Physical Database with Sample Data. Write INSERT statements that add a few rows to each of the tables, 
-- so that the appropriate (one-to-one and one-to-many) relationships can be tested. Deliverable: a single script with all of the insert statements.


--delete from JAVABlogs;
insert into JAVABlogs(BlogId, BlogName, URL, about, ContactUs) values('JAVABlog1', 'Vogella', 'http://www.vogella.com/', 
'vogella GmbH provides training and support in the area of Eclipse, Java and Android development and well as the Git version control system. We believe in sharing our knowledge, please use our free tutorials to learn about these topics.',
'support@vogella.com, sales@vogella.com');

insert into JAVABlogs(BlogId, BlogName, URL, about, ContactUs) values('JAVABlog2', 'Jenkov', 'http://jenkov.com/', '
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>
        Efficiency Matters - Jenkov.com
    </title>
    <meta name="description" content="">
    <meta name="author" content="ink, cookbook, recipes">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    

    

    <link rel="stylesheet" type="text/css" href="/ink-2.2.0/css/ink.css">
    

    <!--[if IE 7 ]>
    <link rel="stylesheet" href="/ink-2.2.0/css/ink-ie7.css" type="text/css" media="screen" title="no title" charset="utf-8">
    <![endif]-->

    
    
    <meta name="google-site-verification" content="i_TwzdElg-by5uXLvyAjuIaCjxo0yjtW8LdRPUDEEcw" />
</head>

<body>

<style>
    #top-bar-background-div {
        width: 100%;
        xwidth: 1280px;
        margin-left : auto;
        margin-right: auto;
        background-color: #000000;
    }
    .ct-logo {
        font-size: 24px;
        xmargin-left : 30px;
        margin-right: 30px;
        padding-top: 3px;
        Color    : #ffffff;
        display: inline-block;
    }
    .menu-item, .menu-item-last {
        border-left : 1px solid #404040;
        font-size   : 18px;
    }
    .menu-item-last {
        border-right : 1px solid #404040;
    }

</style>

<div id="top-bar-background-div">
    <div id="ink-grid" class="ink-grid">


        <div class="column-group">
            <div class="large-100">
                <nav class="ink-navigation">
                    <ul class="menu horizontal black flat">
                        <li><a href="http://jenkov.com" style="margin: 0px; padding: 0px;"><div class="ct-logo">Jenkov.com</div></a></li>
                        <li class="menu-item"><a href="/books/index.html">Books</a></li>
                        <li class="menu-item"><a href="http://tutorials.jenkov.com">Tutorials</a></li>
                        
                        <li class="menu-item"><a href="http://jenkov.com/about/index.html">About</a></li>
                        <li class="menu-item"><a href="http://feeds2.feedburner.com/jenkov-com">RSS</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>


<div class="ink-grid">
<div class="column-group gutters" style="padding-top: 30px;">
<div class="large-50 medium-50 small-100" >


<h2>About Jakob Jenkov</h2>

<p>
    I am an entrepreneur, author and software developer focused on efficiency.
    Analyzing and conveying ideas of efficiency across various domains is what drives me.
    I want to make people efficient, to write books and articles that teaches efficiently,
    and to be as efficient as possible in the process.
</p>

<p>
    I have a background in software development. I have a bachelor in computer science from
    <a href="http://www.ruc.dk">RUC</a>, and a master in IT from <a href="http://www.itu.dk">ITU</a>.
    I have worked with internet technologies since 1998, and with Java since 1999. The majority of the time from 2000 to 2011
    I have worked as a freelance Java developer for bigger organizations (IBM, CSC, Nordea, SDC etc.).

</p>

<p>
    Since 2008 my focus has gradually changed towards the concept of efficiency, both in software development
    and other areas like entrepreneurship, marketing, personal productivity etc. From 2012, efficiency
    is my main focus - the the common theme of the projects I engage in. Having a systematic, analytical
    and logical background from software development is a good base for analyzing efficiency.
</p>

    <p>
        I am currently board member of Dam Communications, an online media company.
    </p>


<h2>About Jenkov Aps</h2>

<p>
    Jenkov Aps is the company through which I conduct my ventures into implementing software, conveying knowledge
    or consulting for clients, since the year 2000.
</p>

<p>
    Historically Jenkov Aps was primarily a software development company. But since 2008 that has gradually
    changed. Software still plays a central role in the company activities, but the purpose is now no longer
    just to develop software.
</p>

<p>
    Today Jenkov Aps is a technology company seeking to increase the efficiency of the world through
    efficient tools and efficient education. The internet is one of the best platforms for
    for making tools available (online access or download), and for
    conveying information. Therefore internet technology often plays a significant role in the company
    activities.
</p>
</div>

<div class="large-50 medium-50 small-100">
    <h2>Contact Jenkov ApS</h2>
    <p>
        Jenkov ApS <br/>
        
        Denmark <br/><br/>
        <b>info {at} jenkov.com</b> <br/>
        <b>support {at} jenkov.com</b> - for feedback and support questions.
        <br/><br/>
        Remember to replace the {at} with @ in the email addresses.
    </p>

    <h2>News Feeds</h2>
    <p>
        <img src="/images/rss.png" />
        <a href="http://jenkov.com/rss/rss_all.jsp">RSS - Jenkov.com News</a>
    </p>
</div>

</div>
</div>

<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push([''_setAccount'', ''UA-4036229-1'']);
    _gaq.push([''_trackPageview'']);

    (function() {
        var ga = document.createElement(''script''); ga.type = ''text/javascript''; ga.async = true;
        ga.src = (''https:'' == document.location.protocol ? ''https://ssl'' : ''http://www'') + ''.google-analytics.com/ga.js'';
        var s = document.getElementsByTagName(''script'')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>

</body>
</html>
', 'info@jenkov.com, support@jenkov.com ');


--delete from CategoryTable;
insert into  CategoryTable(CategoryId ,BlogId, CategoryName, CategoryURL, Details ) values('C01', 'JAVABlog1', 'Read free tutorials', 'http://www.vogella.com/tutorials/', Null);
insert into  CategoryTable(CategoryId ,BlogId, CategoryName, CategoryURL, Details ) values('C02', 'JAVABlog1', 'Order training', 'http://www.vogella.com/training/', Null);
insert into  CategoryTable(CategoryId ,BlogId, CategoryName, CategoryURL, Details ) values('C03', 'JAVABlog1', 'Purchase Books', 'http://www.vogella.com/books/index.html', Null);
insert into  CategoryTable(CategoryId ,BlogId, CategoryName, CategoryURL, Details ) values('C04', 'JAVABlog1', 'Get Consulting', 'http://www.vogella.com/consulting/', Null);
insert into  CategoryTable(CategoryId ,BlogId, CategoryName, CategoryURL, Details ) values('C05', 'JAVABlog1', 'Support Free Tutorial', 'http://www.vogella.com/support.html/', Null);
insert into  CategoryTable(CategoryId ,BlogId, CategoryName, CategoryURL, Details ) values('C06', 'JAVABlog1', 'Vogella Company', 'http://www.vogella.com/company/', Null);
insert into  CategoryTable(CategoryId ,BlogId, CategoryName, CategoryURL, Details ) values('C07', 'JAVABlog1', 'Vogella Blog', 'http://blog.vogella.com/', 
'<p>I&#8217;m proud to say that we at vogella GmbH are also very active in the platform team. <a href="https://twitter.com/simonscholz" onclick="_gaq.push([''_trackEvent'', ''outbound-article'', ''https://twitter.com/simonscholz'', ''Simon'']);" >Simon</a> and myself are trying the help as much as possible. Here is screenshot of the <a href="https://projects.eclipse.org/projects/eclipse.platform.ui/who" onclick="_gaq.push([''_trackEvent'', ''outbound-article'', ''https://projects.eclipse.org/projects/eclipse.platform.ui/who'', ''Platform.ui project homepage'']);" >Platform.ui project homepage</a>. vogella GmbH is currently not listed as organization here, as we currently prefer to contribute development resources instead of money to the Eclipse project. </p>
<p><a href="http://blog.vogella.com/wp-content/uploads/2014/10/platformcontributions.png" onclick="_gaq.push([''_trackEvent'', ''outbound-article-int'', ''http://blog.vogella.com/wp-content/uploads/2014/10/platformcontributions.png'', '''']);" ><img src="http://blog.vogella.com/wp-content/uploads/2014/10/platformcontributions.png" alt="platformcontributions" width="554" height="535" class="aligncenter size-full wp-image-6876" /></a></p>
<p>We have certain areas which we find important and plan to work on. </p>
<p><strong>Reduce technical depts:</strong></p>
<p>1.) Clean-up Eclipse platform code to make it more accessible to new contributors<br />
2.) Migrate the Eclipse platform.ui test suites to Junit 4<br />
3.) Integrate the tests suites into the Gerrit build for new contributions<br />
4.) Retire outdated coding</p>
<p>While these activities do not provide direct user value, we think on the long run they will pay out very highly for the end user.</p>
<p><strong>Review as much contributions as possible and coach potential new committers:</strong></p>
<p>We try to review as much as incoming Gerrit reviews as possible. We also try to coach new contributors to become eventually new committers.</p>
<p><strong>Improve usability:</strong></p>
<p>We have the advantage of <a href="http://www.vogella.com/consulting/" onclick="_gaq.push([''_trackEvent'', ''outbound-article-int'', ''http://www.vogella.com/consulting/'', ''developing Eclipse plug-ins and RCP applications with our customers'']);" >developing Eclipse plug-ins and RCP applications with our customers</a> and delivering on a regular basis <a href="http://www.vogella.com/training/eclipse/index.html" onclick="_gaq.push([''_trackEvent'', ''outbound-article-int'', ''http://www.vogella.com/training/eclipse/index.html'', ''Eclipse Plug-in and RCP training and workshop sessions'']);" >Eclipse Plug-in and RCP training and workshop sessions</a>. During these activities we frequently see inconsistencies and usability issues in the Eclipse IDE. </p>
<p>We plan to work on these. This also means for us to contribute to PDE, JDT, m2e and other components of the platform.</p>
<p><strong>Improve interactive performance:</strong></p>
<p>Together with our virtual friends from Google and IBM we work on improving the interactive performance of the Eclipse IDE. I blog about this in a later post.</p>
<p><strong>Improve Eclipse 4 programming support in the Eclipse IDE:</strong></p>
<p>This mainly improves migration existing components to the Eclipse 4 programming model so that other projects can easier use the Eclipse 4 programming model.</p>
<p>We very much enjoy working on the Eclipse platform and we start to see <a href="http://www.vogella.com/books/eclipsecontribution.html" onclick="_gaq.push([''_trackEvent'', ''outbound-article-int'', ''http://www.vogella.com/books/eclipsecontribution.html'', ''more and more contributions'']);" >more and more contributions</a>. </p>
<p>Good times ahead for the Eclipse IDE.</p>'
);


insert into SubCategoryTable(SubCategoryId ,CategoryId ,SubCategoryName ,SubCategoryURL ,Details ) values ('SC01', 'C01', 'Android Programming', 'http://www.vogella.com/tutorials/android.html', Null);
insert into SubCategoryTable(SubCategoryId ,CategoryId ,SubCategoryName ,SubCategoryURL ,Details ) values ('SC02', 'C01', 'Eclipse IDE and Tools', 'http://www.vogella.com/tutorials/eclipseide.html', Null);
insert into SubCategoryTable(SubCategoryId ,CategoryId ,SubCategoryName ,SubCategoryURL ,Details ) values ('SC03', 'C01', 'JAVA', 'http://www.vogella.com/tutorials/java.html', Null);
insert into SubCategoryTable(SubCategoryId ,CategoryId ,SubCategoryName ,SubCategoryURL ,Details ) values ('SC04', 'C01', 'Technology', 'http://www.vogella.com/tutorials/technology.html', Null);



insert into TopicTable(TopicId ,SubCategoryId ,TopicHeader , TopicURL ,Details) values ('T01', 'SC03', 'Java introduction', NULL, NULL);
insert into TopicTable(TopicId ,SubCategoryId ,TopicHeader , TopicURL ,Details) values ('T02', 'SC03', 'Using the Java core libaries', NULL, NULL);
insert into TopicTable(TopicId ,SubCategoryId ,TopicHeader , TopicURL ,Details) values ('T04', 'SC03', 'XML', NULL, NULL);
insert into TopicTable(TopicId ,SubCategoryId ,TopicHeader , TopicURL ,Details) values ('T05', 'SC03', 'Testing and Code Quality Tools', NULL, NULL);
insert into TopicTable(TopicId ,SubCategoryId ,TopicHeader , TopicURL ,Details) values ('T06', 'SC01', 'Android Development Starter Tutorials', NULL, NULL);
insert into TopicTable(TopicId ,SubCategoryId ,TopicHeader , TopicURL ,Details) values ('T07', 'SC01', 'Using Fragments and the ActionBar', NULL, NULL);


insert into SubTopic (SubTopicId, TopicId ,SubTopicHeader ,SubTopicURL ,Details ) values('ST01', 'T01', 'Introduction to Java programming - Tutorial', 'http://www.vogella.com/tutorials/JavaIntroduction/article.html',
'1. Introduction to Java
1.1. History
Java is a programming language created by James Gosling from Sun Microsystems (Sun) in 1991. The first publicly available version of Java (Java 1.0) was released in 1995.

Sun Microsystems was acquired by the Oracle Corporation in 2010. Oracle has now the steermanship for Java.

Over time new enhanced versions of Java have been released. The current version of Java is Java 1.7 which is also known as Java 7.

From the Java programming language the Java platform evolved. The Java platform allows software developers to write program code in other languages than the Java programming language which still runs on the Java virtual machine. The Java platform is usually associated with the Java virtual machine and the Java core libraries.

1.2. Java and Open Source
In 2006 Sun started to make Java available under the GNU General Public License (GPL). Oracle continues this project called OpenJDK.

1.3. Java Virtual machine
The Java virtual machine (JVM) is a software implementation of a computer that executes programs like a real machine.

The Java virtual machine is written specifically for a specific operating system, e.g., for Linux a special implementation is required as well as for Windows.');

insert into SubTopic (SubTopicId, TopicId ,SubTopicHeader ,SubTopicURL ,Details ) values('ST02', 'T01', 'Defining and using Java libraries via JAR files ', 'http://www.vogella.com/tutorials/JavaLibraries/article.html',
'Lars Vogel

Version 2.5

Copyright © 2008, 2009, 2010, 2011, 2012, 2013, 2014 Lars Vogel

19.09.2014

Revision History
Revision 0.1 - 2.5	07.08.2008 - 02.02.2013	Lars
Vogel
created, bug fixes and updates
Using Java jar files

This tutorial explains the usage and purpose of Java JAR files.

Table of Contents

1. Defining and using Java libraries
1.1. What is a JAR file?
1.2. Using Java libraries
2. Executable JAR
3. Support this website
3.1. Thank you
3.2. Questions and Discussion
4. Links and Literature
1. Defining and using Java libraries
1.1. What is a JAR file?
A JAR file is a Java archive based on the pkzip file format. JAR files are the deployment format for Java. A JAR can contain Java classes and other resources (icons, property files, etc.) and can be executable.

You can distribute your program in a jar file or you can use existing java code via jars by putting them into your classpath.

1.2. Using Java libraries
If you add a JAR file to your classpath, you can use its classes in your Java application.

2. Executable JAR
An executable JAR means the end-user can run the Java application without explicitly specifying the Java class which should be started. This is done via a MANIFEST.MF file which tells the JVM among other things which class contains the main() method and the classpath.

The following example shows one possible MANIFEST.MF file.

Manifest-Version: 1.0 
Main-Class: com.vogella.example.MyApp 
Class-Path:. lib/jcommon-1.0.6.jar lib/itext-1.4.6.jar 
An empty line is required at the end of the MANIFEST.MF file.

You can create an executable JAR file via the following command.

 jar -cvmf MANIFEST.MF app1.jar *.class 
Eclipse provides an export wizard to create a JAR file which can be started via File → Export → Java → JAR file');


insert into SubTopic (SubTopicId, TopicId ,SubTopicHeader ,SubTopicURL ,Details ) values('ST03', 'T06', 'Android development tools installation - Tutorial', 'http://www.vogella.com/tutorials/AndroidInstallation/article.html',
'<div class="toc">
            <p><b>Table of Contents</b></p>
            <dl>
               <dt><span class="section"><a href="#installoverview">1. Installation of the Android development tools</a></span></dt>
               <dt><span class="section"><a href="#installrequirements">2. Requirements</a></span></dt>
               <dd>
                  <dl>
                     <dt><span class="section"><a href="#installation_system">2.1. System requirements</a></span></dt>
                     <dt><span class="section"><a href="#installation_linux64">2.2. Requirements for using a 64-bit Linux</a></span></dt>
                     <dt><span class="section"><a href="#installation_linuxopenlg">2.3. Linux and OpenGL - Failed to load libGL.so </a></span></dt>
                  </dl>
               </dd>
               <dt><span class="section"><a href="#installation">3. Install Android Developer Tools</a></span></dt>
               <dd>
                  <dl>
                     <dt><span class="section"><a href="#adtinstallation_full">3.1. Download packaged Android Developer Tools</a></span></dt>
                     <dt><span class="section"><a href="#installation_start">3.2. Stand-alone ADT installation</a></span></dt>
                     <dt><span class="section"><a href="#installation_update">3.3. Update an existing Eclipse IDE</a></span></dt>
                  </dl>
               </dd>
               <dt><span class="section"><a href="#androidapiversion_installation">4. Install Android SDK version</a></span></dt>
               <dd>
                  <dl>
                     <dt><span class="section"><a href="#androidapiversion_sdk">4.1. Using the Android SDK manager</a></span></dt>
                     <dt><span class="section"><a href="#adtinstallation_supportlibrary">4.2. Install support library</a></span></dt>
                  </dl>
               </dd>
               <dt><span class="section"><a href="#android_sourcecode">5. Accessing the Android SDK code in Eclipse</a></span></dt>
               <dd>
                  <dl>
                     <dt><span class="section"><a href="#android_sourcecodeinstallation">5.1. Installation</a></span></dt>
                     <dt><span class="section"><a href="#android_sourcecodeconnect">5.2. Connect source to the Eclipse IDE</a></span></dt>
                     <dt><span class="section"><a href="#android_sourcecodevalidate">5.3. Validate</a></span></dt>
                  </dl>
               </dd>
               <dt><span class="section"><a href="#androidstudio">6. Android Studio</a></span></dt>
               <dd>
                  <dl>
                     <dt><span class="section"><a href="#androidstudio_ide">6.1. Android Studio based on IntelliJ IDEA</a></span></dt>
                     <dt><span class="section"><a href="#androidstudio_installation">6.2. Installation</a></span></dt>
                  </dl>
               </dd>
               <dt><span class="section"><a href="#updateeclipseide">7. Updating an Eclipse IDE for Android development</a></span></dt>
               <dd>
                  <dl>
                     <dt><span class="section"><a href="#installation_eclipseadt">7.1. Install ADT Plug-ins and Android SDK</a></span></dt>
                     <dt><span class="section"><a href="#installation_androidsdk">7.2. Manual installation of the Android SDK</a></span></dt>
                  </dl>
               </dd>
               <dt><span class="section"><a href="#thankyou">8. Support this website</a></span></dt>
               <dd>
                  <dl>
                     <dt><span class="section"><a href="#thankyou">8.1. Thank you</a></span></dt>
                     <dt><span class="section"><a href="#questions">8.2. Questions and Discussion</a></span></dt>
                  </dl>
               </dd>
            </dl>
         </div>	');



-- 5. Query the Data. Here, your deliverables are to write 
-- (1) a SQL query that returns all of the blog posts, with associated comments and tags; 
-- (2) a SQL query that returns all of the posts for a given tag.


-- a SQL query that returns all of the blog posts, with associated comments and tags; 
select subtopicheader posts, subtopicurl URL, details from subtopic;

--a SQL query that returns all of the posts for a given tag.
--Returning all posts for JAVA SubCategory
select a.SubCategoryName CetgoryName, b.TopicHeader Topic, c.SubTopicHeader, c.Details from 
SubCategoryTable a, TopicTable b , subTopic c 
where a.SubCategoryId = b.SubCategoryId
and b.TopicId = c.TopicId and a.SubCategoryName='JAVA';


--Challenge part
--1. Create a parameterized query that lets you specify a single post (e.g. by post title) and returns information about the post, including any associated comments and tags.

PREPARE parametrisedcategory (varchar(100)) AS
select a.SubCategoryName CetgoryName, b.TopicHeader Topic, c.SubTopicHeader, c.Details from 
SubCategoryTable a, TopicTable b , subTopic c 
where a.SubCategoryId = b.SubCategoryId
and b.TopicId = c.TopicId and a.SubCategoryName=$1;


EXECUTE parametrisedcategory('JAVA');
EXECUTE parametrisedcategory('Android Programming');

-- 2. Implement some server side referential integrity. Example: foreign key relationships, unique indexes, etc. For this assignment, you don’t need to be “comprehensive.” 
-- You may find that you’ll need to re-write your script in Part 4 above, because the order in which you enter rows matters when foreign key relationships are implemented.

-- Created the tables with refernetial integrity.

