# jxa-examples
"JavaScript for Automation" examples

There are not many examples of "JavaScript for Automation" scripts out there, and I needed to solve a relatively trivial problem: when you are using Apple Mail as an Exchange client, deleting large quantities of messages is very failure-prone. Since I'm an Ops Guy, I ge a lot of machine-generated mail, and I wrote the first script here to help keep my mailbox size reasonable.

Installation
============

First, you need to enable the AppleScript menu, which is achieved in the General section of the Script Editor preferences.

Then clone this repo and link, alias or move the desired scripts to your "User Scripts" folder at `~/Library/Scripts`. You'll probably need to change the  mailbox name at the start of the script, as described in the comments.

Finally, select some mail you would like to delete, and then pick the script from the AppleScript menu.
