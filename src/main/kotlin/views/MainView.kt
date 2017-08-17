package views

import controllers.MainController
import javafx.collections.ObservableList
import javafx.event.ActionEvent
import javafx.scene.Node
import javafx.scene.layout.StackPane
import javafx.scene.layout.VBox
import javafx.stage.Stage
import tornadofx.*
import java.util.logging.Logger
import javafx.scene.Parent
import javafx.scene.control.*
import javafx.scene.layout.AnchorPane
import javafx.scene.paint.Paint
import models.FileDir
import java.util.ArrayList
import javafx.event.Event


/**
 * Created by Matthew Squire on 8/12/17.
 */


class MainView : View("External Brain") {

    companion object {
        val LOG = Logger.getLogger(MainView::class.java.name)
    }

    override val root: VBox by fxml("/layouts/main.fxml")
    var mainController: MainController
    val selectorsStack: StackPane by fxid("SelectorsStack")
    val listViewStack: AnchorPane by fxid("ListViewStack")
    val detailsStack: StackPane by fxid("DetailsStack")
    val viewMenuItem: MenuItem by fxid("viewer_menuitem_id")
    val taggingMenuItem: MenuItem by fxid("tagging_menuitem_id")
    val sortingMenuItem: MenuItem by fxid("sorting_menuitem_id")
    val includeRadioButton: RadioButton by fxid("include_radiobutton_id")
    val excludeRadioButton: RadioButton by fxid("exclude_radiobutton_id")

    init {
        setTopStackPaneTo("ViewSelectorsPane", selectorsStack)
        setTopStackPaneTo("ViewDetailsPane", detailsStack)
        mainController = MainController(currentStage as Stage)
        includeRadioButton.isSelected = true
    }

    fun handleMainListViewClick(e: Event) {
       // mainController.findMainListItem(e.target.tagProperty.getProperty(text))
    }

    fun handleModeMenuAction(e: ActionEvent) {
        when(e.source) {
            viewMenuItem -> {
                setTopStackPaneTo("ViewSelectorsPane", selectorsStack)
                setTopStackPaneTo("ViewDetailsPane", detailsStack)
            }
            taggingMenuItem -> {
                setTopStackPaneTo("TaggingSelectorsPane", selectorsStack)
                setTopStackPaneTo("TaggingDetailsPane", detailsStack)
            }
            sortingMenuItem -> {
                setTopStackPaneTo("SortingSelectorsPane", selectorsStack)
                setTopStackPaneTo("SortingDetailsPane", detailsStack)
            }
            else -> {
                LOG.severe("MenuItem not found!")
            }
        }
    }

    private fun setTopStackPaneTo(paneId: String, stack: StackPane) {
        val panes: ObservableList<Node> = stack.children
        val topNode: Node = panes.get(panes.size - 1)
        var newTopNode: Node = topNode
        if(panes.size > 1) {
            for(pane in panes) {
                if(pane.id == paneId) {
                    newTopNode = pane
                }
            }
            topNode.isVisible = false
            newTopNode.isVisible = true
            newTopNode.toFront()
        }
    }

    fun handleIncludeRadioButtonEvent(e: ActionEvent) {
        when(e.source) {
            includeRadioButton -> {
                excludeRadioButton.isSelected = !excludeRadioButton.isSelected
                excludeRadioButton.isSelected = !includeRadioButton.isSelected
                mainController.inclusiveDirItem = includeRadioButton.isSelected
            }
            excludeRadioButton -> {
                includeRadioButton.isSelected = !includeRadioButton.isSelected
                includeRadioButton.isSelected = !excludeRadioButton.isSelected
                mainController.inclusiveDirItem = includeRadioButton.isSelected
            }
        }
        LOG.finer("Inclusiveness is: " + mainController.inclusiveDirItem)
    }

    fun handleApplyButtonEvent(e: ActionEvent) {
        val fileCollection = getNodeById(listViewStack, "main_listview_id") as ListView<*>
        mainController.populateCollection()
        fileCollection.items = mainController.fileCollection
    }

    fun handleAddDirectoryEvent(e: ActionEvent) {
        val fileBox: TextField = getNodeById(selectorsStack, "filefield_textbox_id") as TextField
        mainController.addDirectory(fileBox)
        val fileList = getNodeById(selectorsStack, "directory_listview_id") as ListView<FileDir>
        fileList.items = mainController.fileList

        fileList.cellFormat {
            graphic = cache {
                form {
                    fieldset {
                        label(it.file.path) {
                            style {
                                borderColor += box(Paint.valueOf(it.color))
                                borderInsets += box(3.px)
                            }
                        }
                    }
                }
            }
        }
        fileBox.deleteText(0, fileBox.text.length)
    }

    fun handleRemoveDirectoryEvent(e: ActionEvent) {
        val fileList = getNodeById(selectorsStack, "directory_listview_id") as ListView<*>
        mainController.fileList
                .filter { fileList.selectedItem == it }
                .forEach { mainController.fileList.remove(it) }
    }

    /**
     * About MenuItem Action that launches the about information screen.
     */
    fun handleAboutMenuAction() {
        replaceWith(AboutView::class)
    }

    fun getNodeById(root: Parent, id: String): Node {
        val selectorsStackNodeList: ArrayList<Node> = getAllNodes(root)
        var node: Node = selectorsStackNodeList.get(0)
        for(child in selectorsStackNodeList) {
            if(child.id == id) {
                node = child
                break
            }
        }
        return node
    }

    fun getAllNodes(root: Parent): ArrayList<Node> {
        val nodes = ArrayList<Node>()
        addAllDescendents(root, nodes)
        return nodes
    }

    private fun addAllDescendents(parent: Parent, nodes: ArrayList<Node>) {
        for (node in parent.childrenUnmodifiable) {
            nodes.add(node)
            if (node is Parent)
                addAllDescendents(node, nodes)
        }
    }

}