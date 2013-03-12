# SSLTestDemo

A simple sample to show a problem with Unit Tests on the Command line using SSL

## Goal

Our goal is to execute our Unit Tests within a Continuous Integration environment ([Jenkins](http://jenkins-ci.org "Jenkins CI"))

(I believe it is essential for every question to state what exactly one is trying to achieve. Maybe the problem can actually be solved a very different way)

## Problem resolved so far

Running tests from the command line sounds pretty straighforward, but

	xcodebuild -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO clean test

results in an ugly error:

	unsupported build action 'test'

So I searched the web and found this article on [Running OCUnit Tests from Command Line](http://www.raingrove.com/2012/03/28/running-ocunit-and-specta-tests-from-command-line.html "Running OCUnit Tests from Command Line").

I followed all the steps, and I can run my tests from the command line like this:

	xcodebuild -scheme CITests -sdk iphonesimulator TEST_AFTER_BUILD=YES ONLY_ACTIVE_ARCH=NO clean build

## Remaining Problem

However, now any NSURLConnection to an SSL Server will fail, because "The certificate for this server is invalid.". I have heared about keychain issues when running tests from the command line, but can this be true? Any SSL connection is refused?

## To Reproduce

Get the sample at https://github.com/below/SSLTestDemo. Open it up, and run the sample test using Xcode's own **Test ⌘U** command. The test should succeed.

Now run the test on the command line:

	xcodebuild -scheme CITests -sdk iphonesimulator TEST_AFTER_BUILD=YES ONLY_ACTIVE_ARCH=NO clean build

The test fails due to the "The certificate for this server is invalid." error.

## Any Pointers?

* Am I doing it wrong? 
* Is this a genuine bug? 
* If so, are there workaroungs?

Any input is appreciated!

- - - -

## Legal Stuff ##
![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")

To the extent possible under law, Alexander von Below has waived all copyright and related or neighboring rights to SSLTestDemo. This work is published from: Germany.


