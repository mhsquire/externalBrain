
package controllers

import javafx.collections.FXCollections
import javafx.collections.ObservableList
import javafx.scene.control.TextField
import javafx.stage.DirectoryChooser
import javafx.stage.Stage
import models.FileDir
import tornadofx.*
import java.io.File
import java.util.logging.Logger


/**
 * Created by Matthew Squire on 8/12/17.
 */

class MainController(val stage: Stage): Controller() {

    companion object {
        val LOG = Logger.getLogger(MainController::class.java.name)
    }

    var fileList: ObservableList<FileDir> = FXCollections.observableArrayList<FileDir>()

    var fileBox: File = File("")
    val fileCollection: ObservableList<File> = FXCollections.observableArrayList<File>()
    var inclusiveDirItem: Boolean = true

    fun populateCollection() {
        fileCollection.remove(0, fileCollection.size)
        val inclusiveListSequence: Sequence<File> = returnFileSequence(fileList)
        for(file in inclusiveListSequence) {
            fileCollection.add(file)
        }
    }

    fun returnFileSequence(fileList: ObservableList<FileDir>): Sequence<File> {
        var sequenceOfFiles: Sequence<File> = emptySequence<File>()
        for(fileDir in fileList) {
            val directory = fileDir.file
            val include = fileDir.inclusive
            if(include){
               sequenceOfFiles += directory.walkTopDown().asSequence()
            } else {
               sequenceOfFiles -= directory.walkTopDown().asSequence()
            }
        }
        return sequenceOfFiles
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
        for (fileDir in fileList) {
            val file = fileDir.file
            if(file.path == fileBox.path){
                return
            }
        }
        fileList.add(FileDir(fileBox, inclusiveDirItem))
        LOG.finer("fileList size: " + fileList.size)
        LOG.finer("Path of added directory: " + fileList.get(fileList.size - 1).file.absolutePath)
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

    fun findMainListItem(text: String) {
        System.out.println(text)
    }

}