package views

import javafx.event.ActionEvent
import javafx.fxml.FXML
import javafx.scene.control.MenuItem
import javafx.scene.layout.AnchorPane
import javafx.scene.layout.VBox
import tornadofx.View

/**
 * Created by msquir201 on 8/12/17.
 */


class MainView : View("External Brain") {
    override val root: VBox by fxml("/layouts/main.fxml")

    /**
     * About MenuItem Action that launches the about information screen.
     */
    fun handleAboutMenuAction() {
        replaceWith(AboutView::class)
    }
}