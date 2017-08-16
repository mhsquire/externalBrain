package models

import javafx.scene.paint.Color
import javafx.scene.paint.Paint
import sun.font.FileFont
import tornadofx.*
import java.io.File
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.attribute.BasicFileAttributes
import java.nio.file.attribute.PosixFileAttributes

/**
 * Created by Matthew Squire on 8/14/17.
 */

class FileDir(val file: File, val inclusive: Boolean) {

    val color: String =  if (inclusive) "#ffffff" else "#a94442"
    val path = file.toPath()
    val attr = Files.readAttributes(path, BasicFileAttributes::class.java)

    override fun toString(): String {
        return file.absolutePath
    }
}
