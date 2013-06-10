Record-and-Playback
===================

currently Record and Playback is supported by Selenium Buidler

[Selenium Builder](http://sebuilder.github.io/se-builder/)

### Taken from [Builder Docs]()

## Selenium Builder 0.9.6 

### Installation
Selenium Builder is an extension for the Firefox browser which make installation a snap.

#### Step 1 
Launch Firefox and navigate to the [Selenium Builder download page](http://sebuilder.github.io/se-builder/) or [view on Github](http://github.com/sebuilder/se-builder)

#### Step 2 
Click the [Install](http://www.saucelabs.com/addons/selenium-builder-latest.xpi) button
![download now!](images/download_now.png)
If prompted, confirm that you would like to allow installation from this location.

#### Step 3
Click through the wizard
![todo](TODO)

#### Step 4
Restart Firefox

#### Step 5
Start Selenium builder by choosing <i>Launch Selenium Builder</i> item from the Tools menu.

or from the Selenium Labs logo in the browser quicklaunch bar.
Once installed, you will be notified of updated versions of Selenium Builder automatically thanks to the seamless integration with Firefox.

### Recording your first script
Recording a new script is ridiculously easy.

#### Step 1
Put the starting URL for your script in the URL box of Selenium Builder and press click <i>Go!</i>.

#### Step 2 
Switch windows from Selenium Builder to the main Firefox one. Notice that there is a tab that is green; this is the Selenium Builder tab where your interactions will be captured.

#### Step 3
Interact with your application in whatever means is needed to fulfill your script's requirements.

#### Step 4 
A script that goes end-to-end without error tells provides value, but really there needs to be some checks put in it. To add a check while recording, click the <i>Record a verification</i> button. This pauses recording and enables the element highlighter.
![element highlighter](https://raw.github.com/sebuilder/se-builder/master/docs/images/element_highlighter.png)
Using the element highlighter, select the portion of the page you want to check. Once the check is recorded Selenium Builder returns to recording actions.
![verify text present](https://raw.github.com/sebuilder/se-builder/master/docs/images/verifyTextPresent.png)
By default, the check recorded by Selenium Builder is <i>verifyTextPresent</i>. This is a sensible default, but there are a number of situations where you would want to change it to another one. You can do it during the recording process or afterwards. The procedure for editing a step is the same in either case and is documented in <a href="TODO">Editing a Selenium Builder step</a>

#### Step 5 
Once you have recorded everything you want in the script, click <i>Stop recording</i>

#### Step 6
Perhaps the most important part of recording a script is saving it. After stopping recording, the buttons at the bottom of the Selenium Builder window will change and include one for saving. Clicking it presents you will a list of formats that the script can be saved in.
Selenium Builder supports a number of formats that it can save as, but it's native format is HTML (Selenese). Choose that one for now and save your file. It is now safe to close turn off Selenium Builder.
![save](https://raw.github.com/sebuilder/se-builder/master/docs/images/save.png)

### Opening an existing script
Since Selenium Builder's native format is Selenese, it can import scripts that were created with either Selenium Builder, [Selenium IDE](selenium ide) or [Selenium IDE](http://seleniumhq.org/projects/ide). To load a script created by any of these, click the <i>Open a test file</i> link on the main Selenium Builder screen.

This will open the Firefox file browser for you to find and select your existing Selenese formatted script. Once it has been parsed successfully it will open and be ready for editing.

### Editing a script
Sometimes we know better about what a step should be than what Selenium Builder captured during the recording phase or perhaps our an existing step just needs a bit of fine tuning. In order to do this we click the (change) link beside the step command which reveals up the step details.

The first thing to notice is that rather than having all the possible commands displayed to you in a single list like Selenium IDE they are categorized for easier location.

* Actions - Actions are the most common category of command used when creating Selenese scripts. Commands for clicking, typing and navigation through browser windows and frames are all found here. Actions can be further modified to include basic synchronization by waiting for a page to load as a result of whatever it just did. To enable this modifier, click the <i>Wait for a new page to load after executing the action</i> checkbox and select the AndWait version of the command.

* <i>Checks</i> - Selenium Builder can check the content of the browser in two ways. An <i>assert</i> will stop the script and fail it immediately whereas a <i>verify</i> will continue the script, but fail it at the end. A good script will make use of both types of check; use the radio button below the lists to toggle between the assert commands and the verify ones. To check for the negative of something, check the <i>assert that something is not true</i> box.
 
* <i>Waits</i> - More complex synchronization commands can be found in the Waits list. WaitForElementPresent, WaitForVisible and WaitForEval are all found here. As are WaitForElementNotPresent, WaitForNotVisible and WaitForNotEval when you select the <i>wait for the condition to stop being true</i> box.

* <i>Other</i> - Some commands cannot be easily categorized; settings and screenshots for instance. These are listed under Other.

Regardless of which command you select, if it requires additional information (like a locator), the fields for those details will be shown at the bottom of the details section.

Once the step reflects your intention, click the <i>OK</i> button to save the changes.

Changing existing steps is the most common task when editing a script but sometimes it is easier to just remove chunks and replace them with new ones.

To remove a step from the script, open the tasks menu at the right of the step and choose to <i>delete step</i>. After accepting the warning that this is a one-way process the step will be gone.

Once the step is gone you can either manually <i>Append one step</i> or <i>Record further steps</i>. Which one you choose is largely dependant on how many steps will be needed to added to the script.

Both recording new steps and appending new step will put them at the end of the script. To move them, simply drag each step to the desired location.

### Script Playback
While useful testing and observation happens during the recording process, it is important to actually run the scripts we create for maximum value. Selenium Builder can playback scripts either locally or in [Selenium RC](FINDME).

Very rarely do all the locators and synchronization work exactly as intended the first time. Because of this you should run your script locally first to work out all the hitches before attempting to run it in the cloud. To run the script locally, click the <i>Run test locally</i> button. The steps will be executed in the Selenium Builder tab from the start of the script until there is either an error (incorrect locator, synchronization) or a failed assertion.

The status of each completed step is reflected in its background colour.

* <i>Blue</i> - Not yet run
* <i>Yellow</i> - In process
* <i>Green</i> - Success
* <i>Red</i> - Failure

A solid green script indicates success and is what we are aiming for. Red steps indicate some further investigation is required either to determine if this is a legitimate failure or as a result of a locator or synchronization problem. In the case of the latter, go back and edit the script to solve the issue

With your script running locally it is time to try it on Selenium RC. To do this, click <i>Run on Selenium RC</i>.


### User Extensions
 Coming Soon...


### Saving Non-Selenese scripts
Part of the power of Selenium Builder is its ability to save recorded scripts into other languages than just Selenese (HTML). While Selenese is convenient, it lacks certain advantages that a full programming language has like conditionals and loops.

To export your Selenium Builder in a non Selenese format, choose the <i>Save to disk</i> button as you would normally but instead of selecting HTML select the format you want to export as. For instance, <i>Java (TestNG) - Selenium RC</i> saves the script in such a way that it can be run from the popular Java test framework JUnit against your local Selenium server.

![save as](https://raw.github.com/sebuilder/se-builder/master/docs/images/save_as.png)

Once a script has been saved as a non-Selenese format, that script is no longer considered a Selenium Builder script and cannot be opened by Selenium Builder -- even if no changes have been made to the underlying script. This is because the various formats can include things that Selenium Builder cannot represent in its GUI. It is because of this that saving in another format should be done only once you have a level of comfort with the script's contents in terms of flow and execution.

That said, exporting to something other than Selenese is considered a Best Practice in the Selenium community. It does increase the level of technical knowledge required to modify scripts though.

### Test Suites
If having one test script is good, then having many is fantastic. Opening one, running it then loading the next would be tedious and inefficient though. For this reason you can group similar scripts as a Suite.

To create a new suite, record a new script or open an existing one and click the <i>Record another script</i> button. This creates a suite for you having the starting script as well as a new one. You now also have some new buttons at the top of Selenium Builder for controlling your suite; all of which do pretty much what they claim to do.

One thing to be aware of though when dealing with suites is that if you change a script, then you need to save the script and if you change a suite then you need to save the suite. Just saving one does not save the other. Like with regular Selenium Builder scripts, suites are an HTML based format so the convention is to save them as .html.

You do not need to have many scripts in a suite to have it be effective; often only two is enough. Consider the situation where the main content that needs to be scripted is behind a username and password form. Sure, you could put those steps in each and every script, but that is a guaranteed method of introducing extra maintenance costs to your script. Instead, what you want to do is isolate the login steps in their own script and include them in the beginning of each suite. Now when the login process changes you don't need to change every script, but just one that is shared across all scripts. (The same trick can be used for logging out at the end of a suite as well.)

At the same time though, be cautious of creating a suite that is too large. Suites often imply or result-in interdependencies between scripts and a failure in the 4th script could interfere in scripts 5 through 37. The result of this cascading failure is too often a hour or two of wasted investigation and debugging.

Don't let that scare you away from suites though; they are an important part of how to manage your investment in automation.


### Unique Values
Sometimes having hardcoded data in scripts in necessary to exercise specific conditions, but in many more cases it is smell indicating the risk of the both the Pesticide Paradox and the Landmine Problem. The Pesticide Paradox is when your application learns to evade your test conditions to hide bugs and the Landmine Problem is when it learns to evade the paths the tests take through the application.

Selenium Builder includes functionality to start addressing the Pesticide Paradox in an area that often requires it the most -- registration. Specifically, Selenium Builder can generate random usernames and email addresses. To enable non-static data with one of these values, choose the <i>unique values</i> task for that step to open the details pane.


* <i>Usernames</i> - An individual Selenium Builder script can have up to 9 unique usernames in them. To insert a unique username, click the ${unique_username_1} link in the details pane. The existing value for the step will be replaced by that value. At runtime, that step will have a string value of 'sbxxxxx' where the x's are random, lower-case values.</li>
* <i>Email Addresses</i> - A Selenium Builder script can also have up to 9 unique email addresses in them. Much like with unique usernames, selecting the ${unique_email_1} link will insert a unique email address at runtime into a step. The email address format is 'sbxxxxx@<your domain>.???.com', again with the x's replaced with random, lower-case values.</li>


With both unique usernames and email addresses, once you have included one, the next one is now available to you in the details pane. This is especially useful for registration forms that have multiple email fields (like social media sites) where you could have _1, _2, _3, etc.


### Locators
There are a number of different ways that Selenium Builder can find the parts of the web page you are trying to automate. Selenium Builder makes use of most of them automatically depending on the situation.

The first group of locators all hook off of a unique attribute value of the desired element.

* <i>id</i> - Locators that begin with id= will interact with the first element that has an id attribute of that value, otherwise the step will error and subsequently fail the script. According to the HTML specification, id's must be unique throughout the page for it to be considered 'valid'. If however your HTML is not valid and there are multiple items on the page with the same id, this will only interact with the first one.

* <i>name</i> - Similar to the id locator, Selenium Builder will interact with the first HTML element that has a matching name attribute to the specified name= value.

* <i>Identifier</i> - While Selenium Builder does not record scripts using this locator, it can play them back so it bears mentioning. A locators without a prefix is consider to be an Identifier one and will check elements on the page first using the id strategy and then the name one if it still hasn't found a match. This is actually the Selenium default strategy, but it requires giving up some control and could return the wrong element if you have markup which has both id and name attributes that share values. 

Whenever possible, it is highly desirable to use the attribute locators mentioned above, but when they are not available, not unique or are randomly generated by the application framework then you need to move to more complex locators.

* <i>xpath</i> - Locators that start with either xpath= or just //. XPath treats your page as a structured document and can traverse it both up and down (and a combination of up and down) making it arguably the most powerful locator Selenium Builder can use. There are some known performance problems with Internet Explorer though which decrease its desirability in situations where you don't need that power. The [XPath Tutorial](http://www.w3schools.com/xpath/default.asp) on W3C Schools is a good place to start to understand how to use it.

* <i>css</i> - The CSS locator strategy should be the structural strategy you choose by default and those locators begin with css=. Selenium Builder actually uses the Sizzle library for its CSS Selector support and so [it's documentation](https://github.com/jeresig/sizzle/wiki) is something you will want to have bookmarked. Unlike xpath though, css can only peer down the page, in the situations where you need to look over your shoulder you are forced to use xpath.

<p>One thing to remember is that both these strategies tie you to the current structure of the HTML. If that structure changes, then you might have a situation where your script is broken even though the button you wanted just moved slightly to the right in the rendered page. This is almost always caused by a 'brittle' structural locator. To de-brittle a locator, try to use move the base element that the locator uses closer to the desired and/or make use of the more sophisticated functions and pseudo-functions that both xpath and css provide like contains() or :contains() on attributes. Selenium Builder has no way of knowing and understanding the pattern of non-random attributes so cannot do this at recording time.</p>

The final Locator is similar to the id and name ones in that it keys off of a link's displayed name.The Link locator, not surprisingly is prefixed with link=. This is another powerful strategy that needs to come with a warning. If your site can be displayed in multiple languages (say, English, French and Spanish) then you will need to to create a copy of the script for each language. This is because when the displayed link content changes, so too does the locator. It is much better to use the id strategy in this situation. But if you don't have a multilingual site, then link= can certainly make your script more readable.

### Synchronization
Aside from using improper or brittle locators for accessing objects on the page, the biggest cause for step failures relates to synchronization. Selenium Builder will execute the steps of your script as fast as your machine will allow, pausing only when it is told to pause.

When recording a script, Selenium Builder knows when a page load occurs and so is able to put in the appropriated waitForPageToLoad step after an action. If you are editing an existing step, you can turn it into a synchronized action by checking the <i>Wait for a new page to load after executing the action</i> box in its step details. These andWait variants are great for simple, Web 1.0 applications but are insufficient for modern, dynamic applications. For that we need some other synchronization approaches.

Dynamic applications that use the AJAX basket of tricks to display content without reloading the page will cause you great amounts of synchronization woes if you try to use andWait with them. The brute-force solution is to insert a <i>setSpeed</i> step which adds a delay to the execution of the next command, but that is not always guaranteed to work (and will over time guarantee that your script takes longer to run than it needs to). Brute-force should not be the goal though; fineness should.

To properly synchronize an AJAX application, the two most common commands are waitForElementPresent and waitForVisible. These ones are employed because most AJAX calls either add/remove elements from a page or show/hide them (or both). These commands are in the <i>page content</i> menu in the <i>wait for condition</i> category and take a locator as an argument.

But even waitForElementPresent and waitForVisible fail some of the times. Especially when dealing with COMET technologies (once such site like that is GMail). Successful synchronization here is a collaboration between the developer writing the AJAX/Comet action and the scripter. Actually, all successful automation is a collaboration, but that's not the point here. Through a combination of setting a property in the browser's window object via the 'completed' callback in and waitForCondition, Selenium Builder will wait until synchronization is achieved. waitForCondition takes two arguments;a Javascript snippet as an argument that it waits for, and a timeout value for how long to wait.
  
![waitForCondition](https://raw.github.com/sebuilder/se-builder/master/docs/images/waitForCondition.png)

In this particular case, the step will wait up to 30 seconds for an attribute on the window object called 'latch' to be given a value of 'done'.

None of these synchronization techniques is a one-size-fits-all solution and most applications will need a combination of all three to be kept in synch.
