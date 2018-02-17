package com.squire.glue;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;

/**
 * Created by Matthew Squire on 8/15/17.
 */
public class FileDeleter {


    public FileDeleter(File[] args) throws IOException {

        // @TODO I don't like the way I selected this.
        // @Todo I don't like the way this isn't integrated into a file manager class.
        // @Todo this fails when there is no directory.
        Path dirToDel = args[1].toPath();
        Files.walkFileTree(dirToDel, new SimpleFileVisitor<Path>() {
            @Override
            public FileVisitResult postVisitDirectory(Path dir, IOException e) throws IOException {
                if (e == null) {
                    Files.delete(dir);
                    return FileVisitResult.CONTINUE;
                } else {
                    System.out.println("Exception while iterating directory.");
                    throw e;
                }
            }
            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException{
                Files.delete(file);
                return FileVisitResult.CONTINUE;
            }
        });
        System.out.println("Directory Structure Deleted.");
    }
}
