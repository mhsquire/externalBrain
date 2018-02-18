package com.squire.glue;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;

/**
 * Created by Matthew Squire on 8/15/17.
 */
public class FileDeleter {
    private static final Logger log = LogManager.getLogger("FileDeleter");


    public FileDeleter(File[] args) throws IOException {

        // @TODO I don't like the way I selected this.
        // @Todo I don't like the way this isn't integrated into a file manager class.
        // @Todo this fails when there is no directory.
        Path dirToDel = args[1].toPath();
        if (!Files.exists(dirToDel)) {
            log.debug("Directory " + dirToDel + " selected for deletion does not exist.");
            return;
        }

        Files.walkFileTree(dirToDel, new SimpleFileVisitor<Path>() {
            @Override
            public FileVisitResult postVisitDirectory(Path dir, IOException e) throws IOException {
                if (e instanceof IOException) {
                    log.error("Exception while iterating directory.");
                    throw e;
                }
                Files.delete(dir);
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                Files.delete(file);
                return FileVisitResult.CONTINUE;
            }
        });
        log.info("Directory Structure Deleted.");
    }
}
