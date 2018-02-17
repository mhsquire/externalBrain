package com.squire.glue;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.EnumSet;

/**
 * Created by Matthew Squire on 8/15/17.
 */
public class FileCopier {

   public FileCopier(File[] args) throws IOException {
        final Path sourceDir = args[1].toPath();
        final Path targetDir = args[1].toPath();

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
