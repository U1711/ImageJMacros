// Prompt for input folder selection
inputDir = getDirectory("Choose the input folder");

// Prompt for output folder selection
outputDir = getDirectory("Choose the output folder");

// Get a list of files in the input folder
list = getFileList(inputDir);

// Loop through the files in batches of two
for (i = 0; i < list.length - 1; i += 2) {
    // Open the first image in the batch
    open(inputDir + list[i]);
    // Convert it to 8-bit format
    run("8-bit");
    // Get the title of the first image
    title1 = getTitle();

    // Open the second image in the batch
    open(inputDir + list[i+1]);
    // Convert it to 8-bit format
    run("8-bit");
    // Get the title of the second image
    title2 = getTitle();

	// Merge channels
	run("Merge Channels...", "c1=" + title2 + " c3=" + title1 + " create");

    // Set the composite image type to RGB Color
    run("RGB Color");

    // Save the merged image with a custom name
    saveAs("Tiff", outputDir + "merged_" + title1 + "_" + title2 + "_");

    // Close the merged image
    close();
    close();
}
