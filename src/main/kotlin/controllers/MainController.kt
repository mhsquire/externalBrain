/**
 * Created by Matthew Squire on 8/12/17.
 */
package controllers

import javafx.collections.FXCollections
import javafx.collections.ObservableList
import javafx.scene.control.TextField
import javafx.stage.DirectoryChooser
import javafx.stage.Stage
import tornadofx.*
import java.io.File
import java.util.logging.Logger


class MainController(val stage: Stage): Controller() {

    companion object {
        val LOG = Logger.getLogger(MainController::class.java.name)
    }

    var fileList: ObservableList<File> = FXCollections.observableArrayList<File>()

    var fileBox: File = File("")
    val fileCollection: ObservableList<File> = FXCollections.observableArrayList<File>()


    fun populateCollection() {
        // Todo KISSed this: I want to add in directory exclusion if that is faster.
        // Essentially walk the collection to the removal site and remove those files from the
        // collection in order. If I am thinking correctly this is more efficient.
        fileCollection.remove(0, fileCollection.size)
        for(dir in fileList) {
            dir.walkTopDown().forEach {
                if(it.isFile) {
                    System.out.println(it.path)
                    fileCollection.add(it)
                }
            }
        }
    }

    fun showFilesChooserForLocationSearch() {
        val dirChooser = DirectoryChooser()
        dirChooser.title = "Add Location to Search"
        try{
        fileBox = dirChooser.showDialog(stage)
        } catch (e: Exception) {
            noop()
        }
    }

    private fun noop() {
        LOG.fine("No operation")
    }

    fun addFileToListFromBox () {
        if(fileBox.absolutePath.isEmpty()) {
            return
        }
        for (file in fileList) {
            if(file.path == fileBox.path){
                return
            }
        }
        fileList.add(fileBox)
        LOG.finer("fileList size: " + fileList.size)
        LOG.finer("Path of added directory: " + fileList.get(fileList.size - 1).absolutePath)
    }

    fun addDirectory(fileBoxView: TextField) {
        if(fileBoxView.text.isEmpty()) {
            showFilesChooserForLocationSearch()
        } else {
            fileBox = File(fileBoxView.text)
        }
        if(fileBox.path.isEmpty()){
            return
        }
        addFileToListFromBox()
    }

}