// Prompt for input folder selection
inputDir = getDirectory("Choose the input folder");

// Prompt for output folder selection
outputDir = getDirectory("Choose the output folder");

// Get a list of files in the input folder
list = getFileList(inputDir);

// Loop through the files in batches of three
for (i = 0; i < list.length; i += 3) {
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

    // Open the third image in the batch
    open(inputDir + list[i+2]);
    // Convert it to 8-bit format
    run("8-bit");
    // Get the title of the third image
    title3 = getTitle();

    // Merge channels
    run("Merge Channels...", "c1=" + title3 + " c2=" + title2 + " c3=" + title1 + " create");

    // Set the composite image type to RGB Color
    run("RGB Color");

    // Save the merged image with a custom name
    saveAs("Tiff", outputDir + "merged_" + title1 + "_" + title2 + "_" + title3 + ".tif");

    // Close the merged image
    close();
    close();
}
