/**
 * Created by msquir201 on 8/12/17.
 */
package controllers

import javafx.stage.DirectoryChooser
import javafx.stage.FileChooser
import javafx.stage.Stage
import tornadofx.*
import java.io.File
import java.util.logging.Logger


class MainController(val stage: Stage): Controller() {

    companion object {
        val LOG = Logger.getLogger(MainController::class.java.name)
    }

    var fileList: ArrayList<File> = ArrayList<File>()

    var fileBox: File = File("")

    fun showFilesChooserForLocationSearch() {
        val dirChooser = DirectoryChooser()
        dirChooser.title = "Add Location to Search"
        fileBox = dirChooser.showDialog(stage)
    }

    fun addFileToListFromBox () {
        if(fileBox.absolutePath.isEmpty()) {
            return
        }
        fileList.add(fileBox)
        LOG.finer("fileList size: " + fileList.size)
        LOG.finer("Path of added directory: " + fileList.get(fileList.size - 1).absolutePath)
    }

}