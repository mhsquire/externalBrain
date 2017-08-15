package models

import java.io.File

/**
 * Created by Matthew Squire on 8/14/17.
 */

class LocationList () {
    lateinit var fileList: List<File>

    init{

    }

    fun setList(list: List<File>) {
        fileList = list
    }

    fun getList(): List<File> {
        return fileList
    }

}
