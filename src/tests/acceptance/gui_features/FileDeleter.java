import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;

/**
 * Created by msquir201 on 8/15/17.
 */
public class FileDeleter {

    FileDeleter(String[] args) throws IOException {
        Path dirToDel = Paths.get(args[1]);
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
