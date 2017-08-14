package views

import controllers.MainController
import javafx.collections.ObservableList
import javafx.event.ActionEvent
import javafx.scene.Node
import javafx.scene.control.MenuItem
import javafx.scene.layout.StackPane
import javafx.scene.layout.VBox
import javafx.stage.Stage
import tornadofx.*
import java.util.logging.Logger
import javafx.scene.Parent
import javafx.scene.control.TextField
import java.util.ArrayList



/**
 * Created by msquir201 on 8/12/17.
 */


class MainView : View("External Brain") {

    companion object {
        val LOG = Logger.getLogger(MainView::class.java.name)
    }

    override val root: VBox by fxml("/layouts/main.fxml")
    var mainController: MainController
    val selectorsStack: StackPane by fxid("SelectorsStack")
    val detailsStack: StackPane by fxid("DetailsStack")
    val viewMenuItem: MenuItem by fxid("viewer_menuitem_id")
    val taggingMenuItem: MenuItem by fxid("tagging_menuitem_id")
    val sortingMenuItem: MenuItem by fxid("sorting_menuitem_id")

    init {
        setTopStackPaneTo("ViewSelectorsPane", selectorsStack)
        setTopStackPaneTo("ViewDetailsPane", detailsStack)
        mainController = MainController(currentStage as Stage)
    }

    fun handleDirectory(){

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

    fun handleAddDirLocationEvent(e: ActionEvent) {
        mainController.showFilesChooserForLocationSearch()
        var fileBox: TextField = TextField()
        val selectorsStackNodeList: ArrayList<Node> = getAllNodes(selectorsStack)
        for(child in selectorsStackNodeList) {
            if(child.id == "filefield_textbox_id") {
                fileBox = child as TextField
                break
            }
        }
        fileBox.appendText(mainController.fileBox.path)
    }

    /**
     * About MenuItem Action that launches the about information screen.
     */
    fun handleAboutMenuAction() {
        replaceWith(AboutView::class)
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