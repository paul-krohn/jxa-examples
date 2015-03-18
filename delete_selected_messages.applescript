// define a reference to the Mail app
mailapp = Application('Mail');

// Define a reference to the trash mailbox you want to move messages to
// you'll need to change "Work" to whatever you entered for the 
// description of the mailbox.
trashMailBox = Application("Mail").accounts.byName("Work").mailboxes.byName("Trash");
console.log("looking for the trash mailbox, found one called " + trashMailBox.name());

// create a list of the selected messages
theMessages = mailapp.selection();

// count them, so you can iterate over each of them, as well as 
// update the progress indicator, Application('Mail').selection 
// does not have a 'length' property, for some reason
originalMessageCount = Object.keys(theMessages).length;
remainingMessageCount = originalMessageCount;

//may as well log how many messages there are to delete
console.log("there are " + originalMessageCount + " messages");

// initialize the progress indicator
Progress.totalUnitCount = originalMessageCount;

// loop until there are no messages left to delete
// we count downwards because otherwise we get an off-by-one error 
// on each iteration of the loop, and only wind up deleting half of the selected messages
while (remainingMessageCount > 0) {
	// Log the subject of the message we are deleting.
	// If you are coming to JavaScript from AppleScript,
	// arrays are zero-indexed, so for an array of length N,
	// the index of the last item is N-1
	console.log("deleting message " + theMessages[remainingMessageCount-1].subject());
	
	// Move the message to the trash mailbox defined above.
	// We should probably detect errors (and bail out) here,
	// rather than just carry on fearlessly. Also, this is a blocking operation.
	// A good optimization might be to delete ranges of messages
	// at a time, so it goes faster when you have a LOT of messages to delete.
	theMessages[remainingMessageCount-1].mailbox = trashMailBox;
	
	// Update the progress indicator.
	Progress.completedUnitCount = (originalMessageCount - remainingMessageCount);
	
	// decrement the remaining message counter
	remainingMessageCount--;
}
