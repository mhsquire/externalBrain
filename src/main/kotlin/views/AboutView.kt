package views

import controllers.MainController
import javafx.scene.layout.AnchorPane
import tornadofx.*

/**
 * Created by msquir201 on 8/12/17.
 */
class AboutView : View("About") {


    override val root: AnchorPane by fxml("/layouts/About.fxml")


    /**
     *  About Ok Action that return to the main menu.
     */
    fun handleOkButtonAction() {
        replaceWith(MainView::class)
    }
}
