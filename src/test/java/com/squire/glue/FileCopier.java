package com.squire.glue;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.EnumSet;

/**
 * Created by Matthew Squire on 8/15/17.
 */
public class FileCopier {
    private static final Logger log = LogManager.getLogger("FileCopier");

   public FileCopier(File source, File target) throws IOException {
        final Path sourceDir = source.toPath();
        final Path targetDir = target.toPath();

       if (!Files.exists(targetDir)) {
           log.debug("Directory " + targetDir + " selected for deletion does not exist.");
           boolean successful = new File(targetDir.toString()).mkdirs();
           if(!successful) {
               log.error("Failed to create target " + targetDir.toString() + "directory.");
               return;
           }
       }

        Files.walkFileTree(sourceDir, EnumSet.of(FileVisitOption.FOLLOW_LINKS), Integer.MAX_VALUE,
            new SimpleFileVisitor<Path>() {
                @Override
                public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                    Path target = targetDir.resolve(sourceDir.relativize(dir));
                    try {
                        Files.copy(dir, target);
                    } catch (FileAlreadyExistsException e) {
                        if (!Files.isDirectory(target))
                            throw e;
                    }
                    return FileVisitResult.CONTINUE;
                }

                @Override
                public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                    Files.copy(file, targetDir.resolve(sourceDir.relativize(file)));
                    return FileVisitResult.CONTINUE;
                }
            });
    }
}
