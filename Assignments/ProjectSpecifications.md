# Design Patterns App


# Project Outline

</br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__*Res Ipsa Loquitur*__  — *A Latin phrase that means: "The thing speaks for itself"*

</br>
</br>


The primary goal of this project is to afford you an opportunity for your knowledge of this course’s topic to speak for itself.

You are to create a a portfolio piece that:
* can be used as a reference for the work you have done in this course, which you might also share with the iOS developer community
* will demonstrate to prospective employers your knowledge of intermediate design patterns relevant to iOS development

Rather than merely answering interview questions about your knowledge of iOS design patterns, you will have an app that speaks for you.

# Data Model

Use your own discretion in choosing a data model/data source for each scene.

Robust data persistence is not required; any simple persistence mechanism (i.e, plist, file system) should suffice, as most of the data will be strings, and the focus of this work is mostly on simple architecture with no user-selected data.

# Feature Outline

Create a table view app which showcases the design patterns covered in Lessons 1 through 6 of this course.

The name of your app is up to you. But it is recommended that you choose a name that states the app’s purpose. Here are some examples:
* MOBDesignPatterns
* Design Patterns
* iOS Design Pattern - *(though this name implies a stronger commitment to showcase iOS-specific illustrations for each pattern)*


Your app is to have the following **characteristics:**

1. Each section in the table view will represent each of the major types of design patterns. i.e., you will create a separate table view section for each of the following:
* "Creational"
* "Behavioral"
* "Structural"

2. Within each table view `section`, each pattern covered in class is to have its own `cell`

__*notes on cell construction:*__
* It is *not required* that cells need to be reusable Prototype cells. Which type of cell you use is up to you
* However, it *is required* that cells provide:
&nbsp;&nbsp;&nbsp; - a subtitle
&nbsp;&nbsp;&nbsp; - a way to invoke a detail scene (i.e, either by creating a Detail cell, or providing a button, which will invoke the detail VC)

3. Tapping any of the cells within a section will launch a subordinate scene presenting a VC of the same name as the cell tapped:
* each pattern's cell will have 2 sub-scenes:
&nbsp;&nbsp;&nbsp;(a) a description of the pattern
&nbsp;&nbsp;&nbsp;(b) an implementation example
* subordinate scenes can be arranged as either:
&nbsp;&nbsp;&nbsp; - in series — i.e., master/detail
&nbsp;&nbsp;&nbsp; - in parallel — i.e., using a Segmented Control
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*(see diagrams below for illustrations)*

__*notes on cell implementation examples:*__
* Whenever possible, try to create a “live” functional example of the pattern (see XXX in the diagram below)
* It is understood that it is extremely difficult to provide live functional examples for some patterns due to their essential nature. For those patterns, you may fall back on using the following to illustrate your knowledge of them:
&nbsp;&nbsp;&nbsp; - example code snippets and/or diagrams


<!--
You should however implement at least one API call that successfully works together with your backend (e.g. only syncing new trips but not changes or deletions).
-->

Stretch Challenges

-

# Screen Layout
<!--
Here are mockups of the individual screens the app should contain, including their connections to each other:

![image](TripPlanner_ScreenFlow.png)

Feel free to design nicer screens than shown in these mockups! They are primarily concerned with the functionality of each screen, not with the specific design or layout.

-->

## Screen Details

<!--
This section provides details for some of the more complex screens.
-->

### Main Screen
<!--
### Main Screen (List of Trips)

This screen should support deleting waypoints by using the iOS swipe-to-delete feature. Additionally you can add an *Edit* that puts the table view into edit mode; this provides the user with another way of deleting elements.

-->

<!--
### Trip Detail Screen

The Trip Detail Screen shows the waypoints for a selected Trip within a Table View. If the trip doesn't have any waypoints yet it shows another view which has a button to add waypoints (*Pro Tip: you can create two different views within in this View Controller and use code to decide which one to display*).

This screen should support deleting waypoints by using the iOS swipe-to-delete feature. Additionally you can add an *Edit* that puts the table view into edit mode; this provides the user with another way of deleting elements.

### Add Waypoint Screen

This screen allows the user to search for waypoints. It displays the search results in a table view. The user can select an entry. The selected entry will be highlighted on the map. By using the *save* button
-->


### Subordinate (Pattern) Scene - Serial Option


### Subordinate (Pattern) Scene - Parallel Option


## Project evaluation criteria

[Link to rubric]()