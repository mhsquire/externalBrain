package views

import javafx.event.ActionEvent
import javafx.scene.control.MenuItem
import javafx.scene.layout.AnchorPane
import javafx.scene.layout.VBox
import tornadofx.*

/**
 * Created by msquir201 on 8/12/17.
 */


class MainView : View("External Brain") {
    var modeSelectors: String = "/layouts/view_selectors.fxml"
    val selectorPane: AnchorPane by fxml(modeSelectors)
    override val root: VBox by fxml("/layouts/main.fxml")
    val selectorsPane: AnchorPane by fxid("selectorspane")


    init {
        selectorsPane.addChildIfPossible(selectorPane)
    }

    /**
     * About MenuItem Action that launches the about information screen.
     */
    fun handleAboutMenuAction() {
        replaceWith(AboutView::class)
    }

    fun handleModeMenuAction(e: ActionEvent) {

        when(e.source) {
            MenuItem by fxid("viewer_menuitem_id") -> modeSelectors = "layouts/tagging_selectors.fxml"
            else -> modeSelectors = "layouts/view_selectors.fxml"
        }

        selectorsPane.replaceChildren(selectorPane)
    }

    fun handleSortingModeMenuAction() {
        modeSelectors = "/layouts/sorting_selectors.fxml"
        selectorsPane.addChildIfPossible(selectorPane)
    }
}