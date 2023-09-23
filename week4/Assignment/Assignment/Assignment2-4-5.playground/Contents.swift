/*: # Assignment 2, 4, 5

 -------------------------------------------------------------------------------

 ## Assignment 2

 There are several methods defined in the `UITableViewDataSource` protocol.

 Which methods are called by the system after we manually call `reloadData()` of a table view and what are their sequences?

 Please describe in as much detail as possible.

 --------------------------------------------------------------------------------

 主要會重新計算 `TableView` 的 `section` 數量、`cell` 數量，以及重新載入 `cell`、`header` 跟 `footer`

 1. 先計算有多少 `section`
    - `func numberOfSections(in: UITableView) -> Int`
 2. 為 `header` 設定 `title`
    - `func tableView(UITableView, titleForHeaderInSection: Int) -> String?`
 3. 為 `footer` 設定 `title`
    - `func tableView(UITableView, titleForFooterInSection: Int) -> String?`
 4. 計算 `section` 中有多少 `cell`
    - `func tableView(UITableView, numberOfRowsInSection: Int) -> Int`
 5. 根據 `title` 顯示的 `section`
    - `func tableView(_ tableView: UITableView,sectionForSectionIndexTitle title: String, at index: Int) -> Int`
 6. 設定 `cell` 的內容
    - `func tableView(UITableView, cellForRowAt: IndexPath) -> UITableViewCell`

 --------------------------------------------------------------------------------------------------

 ## Assignment 4

 Please complete the following function that prints a pyramid made of asterisks.

 ```
 func printPyramid(layers: Int) {
   // TODO: printPyramid
 }
 ```

 For example, here’s what the *output* of `printPyramid(layers: 5)` should be:

 ```
       *
      ***
     *****
    *******
   *********
  ```
 */

func printPyramid(layers: Int) {
  for layer in 1 ... layers {
    print(String(repeating: " ", count: layers - layer), terminator: "")
    print(String(repeating: "*", count: layer * 2 - 1))
  }
}

printPyramid(layers: 5)

/*:------------------------------------------------------------------------------------------------

 ## Assignment 5

 Do you have any App ideas that you are interested in and want to develop?

 List them along with a brief description (2 sentences at most), and no need to consider the availability, required techniques and business models at all.

 --------------------------------------------------------------------------------------------------

 雖然 Nick 說思考 5 分鐘就好，但還是想蠻久才想出來的

 **〖環島小幫手〗** 因為自己之前有徒步環島經驗，可以整合環島常見需求資源，包含行前規劃、地圖、食宿、鄰近補給站、附近的環島者（結合社交功能）、足跡日記

 PS. 交通部也有一個環島的 App ，但一直被罵很爛
 */
