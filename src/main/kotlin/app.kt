package app

import javafx.application.Application
import tornadofx.*
import views.MainView


class ChartApp : App() {
    override val primaryView = MainView::class
}

fun main(args: Array<String>) {
    Application.launch(ChartApp::class.java, *args)
}