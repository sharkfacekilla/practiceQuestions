//
//  ContentView.swift
//  pracrtuceQuestions
//
//  Created by Gage on 2024-03-07.
//

import SwiftUI

import Observation
import SwiftData

///*THINGS TO MAKE A LIST SUCCESSFULLY*
///1. Create an @Observable **class** that represents a single list item
///2. Make the item Identifiable
///@Observable class ItemList: Identifiable {
///3. Create an array of items using @State
///@State private var items = [ItemList]() **IMPORTANT TO DO THIS WAY. CREATES AN EMPTY ARRAY OF ITEM LISTS**
///4. Use @Bindable to make Bindings to the class available

///*WHEN TO USE @...*
///
///@State
///State is meant to store a variable for use by the the current SwiftUI view, and any child views. If a parent view needs to use this variable, State should not be used.
///@State private var someName = someInitialValue
///
///
///
///@Binding
///Binding allows the current view to change a variable that has been passed in from a parent view. We use the form @Binding var someName: someType
///This requires the parent to pass in someName using a $
///Either the parent or one of its ancestors needs to store someName as a @State variable
///Example:
///struct AnotherView: View {
///@Binding var someName: someType
///TextField("Enter Text:", text: someType)
///}
///struct SomeView: View {
///@State private var someName = "someInitialValue"
///AnotherView(someName: $someName)
///}
///
///
///
///Neither @State or @Binding, just var
///This allows us to view, but not change a variable that has been passed in from a parent.
///We use the form var someName: someType
///This requires the parent view to pass in someName without using a $
///
///
///@Observable
///Can be placed infront of a swift class, but not a view. See List examples
///
///
///@Model
///Can be place infront of a swift class.
///In addition to @Observable, it allows us to save/load data stored in that class
///@Query and a model container must also be used
///A model xontext is used for adding and deleting class instances
///**SEE EXAMPLE FOR USE**
///
///
///@Query
///Used in SwiftUI to access a model
///We use @Query private var someName: [someType]
///**Don't attempt to pass someName to another view; if view 1 and view 2 both need access to someName, both should have an @Query private var someName: [someType] declaration **
///
///
///
///@Bindable
///Used to make it possible to bind a variable declared using @Observable/@Model/@Query
///Some compatability issues using NavigationLink
///**SEE EXAMPLE FOR USE**

///Simple List examle with a bindable
//@Observable class Item: Identifiable {
//    var string = "Hello"
//}
//struct MainView: View {
//    @State private var items = [Item(), Item()]
//    var body: some View {
//        List(items) {
//            item in
//            @Bindable var item = item
//            TextField("Text", text: $item.string)
//        }
//    }
//}

										/* LISTS */

///List example with a Text Field and a segmented picker
//@Observable class Task: Identifiable {
//    var taskName: String = ""
//    var weatherCondition: String = ""
//
//    init(taskName: String, weatherCondition: String) {
//        self.taskName = taskName
//        self.weatherCondition = weatherCondition
//    }
//}
//let conditions = ["sun.max", "cloud.sun", "cloud", "cloud.rain"]
//
//struct DetailView: View {
//    @Binding var task: Task
//    var body: some View {
//        HStack {
//            TextField("Item", text: $task.taskName)
//            Picker("Flavor", selection: $task.weatherCondition) {
//                ForEach(conditions, id: \.self) { condition in
//                    Image(systemName: condition)
//                }
//            }.pickerStyle(.segmented)
//        }
//        .padding()
//    }
//}
//
//struct MainView: View {
//    @State private var taskList = [Task(taskName:"do laundry", weatherCondition: "sun.max"), Task(taskName: "wash dishes", weatherCondition: "cloud.rain")]
//    var body: some View {
//        NavigationStack {
//            VStack {
//                List($taskList) { $item in
//                    //@Bindable var item = i
//                    DetailView(task: $item)
//                }
//                .toolbar {
//                    HStack {
//                        Button(action: {
//                            taskList.insert(Task(taskName: "walk the dog", weatherCondition: "sun.max"), at: 0)
//                        }, label: {
//                            Image(systemName: "plus")
//                        })
//                    }
//                }
//            }
//        }
//        .padding()
//}
//}



///question45 (List Example with Slider and Changing Icons)
//@Observable class weatherConditions: Identifiable {
//    var weatherIcon: String = "sun.max"
//    var sliderValue: Double = 0.0
//}
//
//let iconNames = ["sun.max", "cloud.sun", "cloud", "cloud.rain"]
//
//struct RowView: View {
//    @Binding var icon: String
//    @Binding var sliderVal: Double
//
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//            Slider(value:
//                    Binding(
//                        get: { sliderVal },
//                        set: { newValue in
//                            sliderVal = newValue
//                            var val = iconNames[Int(sliderVal)]
//                            icon = val
//                        }
//                    ),
//                   in: 0...3)
//        }
//    }
//}
//
//struct MainView: View {
//    @State var condition = [weatherConditions]()
//    var body: some View {
//        NavigationStack {
//            List($condition) { weather in
//                RowView(icon: weather.weatherIcon, sliderVal: weather.sliderValue)
//            }
//            .toolbar {
//                Button(action:  {
//                    condition.insert(weatherConditions(), at: 0)
//                }
//                ) {
//                    Image(systemName: "plus")
//                }
//            }
//        }
//    }
//}



///To Do List Question with a Toggle
//@Observable class TaskItem: Identifiable {
//    var text = "task"
//    var toggle = false
//}
//
//struct RowView: View {
//    @Binding var task: TaskItem
//
//    var body: some View {
//        HStack {
//            Toggle(isOn: $task.toggle, label: {
//                TextField("", text: $task.text)
//            })
//        }
//        .padding()
//    }
//}
//
//struct MainView: View {
//    @State private var task = [TaskItem]()
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach($task) { t in
//                    RowView(task: t)
//                }
//                ///delete items (needs ForEach)
//                .onDelete { indexSet in
//                    task.remove(atOffsets: indexSet)
//                }
//                ///how to move items (needs ForEach)
//                .onMove { indexSet, destinationSet in
//                    task.move(fromOffsets: indexSet, toOffset: destinationSet)
//                }
//            }
//            .toolbar {
//                EditButton()
//                Button(action:  {
//                    task.insert(TaskItem(), at: 0)
//                }
//                ) {
//                    Image(systemName: "plus")
//                }
//            }
//            .navigationTitle("To Do List")
//        }
//    }
//}



///List Example with a Date Picker and regular picker
//@Observable class TransitItem: Identifiable {
//    var date: Date = Date()
//    var icons: String = ""
//}
//
//let transportModes = ["car", "figure.walk", "figure.outdoor.cycle", "scooter", "airplane", "bus", "cablecar"]
//let transportLabels = ["Car", "Walk", "Cycle", "Scooter", "Airplane", "Bus", "Subway"]
//
//struct RowView: View {
//    @Binding var item: TransitItem
//    var body: some View {
//        HStack {
//            DatePicker("", selection: $item.date,         displayedComponents: .date)
//                .labelsHidden()
//            Picker("", selection: $item.icons) {
//                ForEach(transportModes.indices, id: \.self) { index in
//                    HStack {
//                        Image(systemName: transportModes[index])
//                        Text(transportLabels[index])
//                    }
//                    .pickerStyle(.menu)
//                }
//            }
//        }
//        .padding()
//    }
//}
//
//struct MainView: View {
//
//    @State private var item = [TransitItem]()
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach($item){ t in
//                    RowView(item: t)
//                }
//            }
//            .navigationTitle("Transportation Log")
//            .toolbar {
//                Button(action:  {
//                    item.insert(TransitItem(), at: 0)
//                }
//                ) {
//                    Image(systemName: "plus")
//                }
//
//            }
//        }
//    }
//}



///List with Color Picker and secure text field
//@Observable class ListItem: Identifiable {
//    var color: Color = .red
//    var password: String = ""
//}
//
//struct RowView: View {
//    @Binding var item: ListItem
//    var body: some View {
//        HStack {
//            SecureField(text: $item.password) {
//                Text("Password here")
//            }
//            ColorPicker("", selection: $item.color)
//                .labelsHidden()
//        }
//    }
//}
//struct MainView: View {
//    @State private var item = [ListItem]()
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach($item) { t in
//                    RowView(item: t)
//                }
//                .onDelete(perform: { indexSet in
//                    item.remove(atOffsets: indexSet)
//                })
//            }
//            .navigationTitle("Passwords")
//            .toolbar {
//                EditButton()
//                Button(action: {
//                    item.insert(ListItem(), at: 0)
//                }) {
//                    Image(systemName: "plus")
//                }
//            }
//        }
//        .padding()
//    }
//}


///Example with Model and Bindable, also contains a reversed example with a binding.
///ALSO contains some logic for adding colour and borders based off of another variable.
//@Model class InventoryItem: Identifiable {
//    var itemTxt: String = "Placeholder"
//    var fav: Bool = false
//
//    init(itemTxt: String, fav: Bool) {
//        self.itemTxt = itemTxt
//        self.fav = fav
//    }
//	}
//
//struct DetailView: View {
//    @Bindable var inventoryItem: InventoryItem
//    var body: some View {
//        VStack {
//            if UIImage(systemName: inventoryItem.itemTxt) != nil {
//                if (inventoryItem.fav)
//                {
//                    Image(systemName: inventoryItem.itemTxt)
//                        .padding()
//                        .border(Color.red, width: 5)
//
//                }
//                else {
//                    Image(systemName: inventoryItem.itemTxt)
//                        .padding()
//                }
//            } else {
//                Image(systemName: "questionmark")
//                    .padding()
//            }
//            HStack {
//                TextField("", text: $inventoryItem.itemTxt)
//                    .autocapitalization(.none)
//                Toggle("", isOn: $inventoryItem.fav)
//                    .labelsHidden()
//
//                /// or if you need to use a closure instead
////                Toggle(isOn: $inventoryItem.fav) {
////                    TextField("", text: $inventoryItem.itemTxt)
////                }
//                ///if you need to reverse a binding, probably not, but fun
////                Text(String(inventoryItem.itemTxt.reversed()))
//            }
//        }
//        .padding()
//    }
//}
//
//struct RowView: View {
//    var inventoryItem: InventoryItem
//    var body: some View {
//        VStack {
//            HStack {
//                if UIImage(systemName: inventoryItem.itemTxt) != nil {
//                    Image(systemName: inventoryItem.itemTxt)
//                } else {
//                    Image(systemName: "questionmark")
//                }
//                Text(inventoryItem.itemTxt)
//            }
//        }
//    }
//}
//
//struct MainView: View {
//    //these are important don't forget
//    @Query private var inventoryItems: [InventoryItem]
//    @Environment (\.modelContext) private var modelContext
//
//    var body: some View {
//        NavigationStack() {
//            VStack {
//                List (inventoryItems) {
//                    inventoryItem in
//                    NavigationLink(destination: DetailView(inventoryItem: inventoryItem)) {
//                        RowView(inventoryItem: inventoryItem)
//                    }
//                    .swipeActions(edge: .trailing) {
//                        Button(role: .destructive) {
//                            let item = inventoryItem
//                            modelContext.delete(item)
//                        } label: {
//                            Label("Delete", systemImage: "trash")
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Model Example")
//            .toolbar {
//                Button(action: {
//                    let item = InventoryItem(itemTxt: "car", fav: false)
//                    modelContext.insert(item)
//                }) {
//                    Image(systemName: "plus")
//                }
//            }
//        }
//    }
//}

										/* NAVIGATION QUESTIONS */
///NavigationLink tutorial
//struct CircleNumberView: View {
//    var color: Color
//    var number: Int
//
//    var body: some View {
//        ZStack {
//            Circle()
//                .frame(width: 200, height: 200)
//                .foregroundColor(color)
//            Text("\(number)")
//                .foregroundColor(.white)
//                .font(.system(size: 70, weight: .bold))
//        }
//    }
//}
//
//struct MainView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                CircleNumberView(color: .red, number: 1)
//                    .navigationTitle("Red One")
//                    .offset(y: -60)
//
//                NavigationLink(destination: BlueTwoView(color: .blue), label: {
//                    Text("next screen")
//                        .bold()
//                        .frame(width: 280, height: 50)
//                        .background(.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                })
//            }
//        }
//        .accentColor(Color(.label))
//    }
//}
//
//struct BlueTwoView: View {
//    var color: Color
//
//    var body: some View {
//        VStack {
//            CircleNumberView(color: color, number: 2)
//                .navigationTitle("Blue Two")
//                .offset(y: -60)
//
//            NavigationLink(destination: GreenThreeView(), label: {
//                Text("next screen")
//                    .bold()
//                    .frame(width: 280, height: 50)
//                    .background(.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            })
//        }
//    }
//}
//
//struct GreenThreeView: View {
//    var body: some View {
//        VStack {
//            CircleNumberView(color: .green, number: 3)
//                .navigationTitle("Green Three")
//                .offset(y: -60)
//        }
//    }
//}



///Navigation Q 51
//struct PickerView : View {
//    var capitals: [String]
//    var selectedProvince: String
//    var correctAnswer: String
//    @State var selectedCapital = ""
//    var body: some View {
//        VStack {
//            Text("The capital of \(selectedProvince) is:")
//            Picker("Capitals", selection: $selectedCapital) {
//                ForEach(capitals, id: \.self) { capital in
//                    Text(capital)
//                }
//            }
//            .pickerStyle(.wheel)
//            if selectedCapital == correctAnswer {
//                Image(systemName: "checkmark")
//                    .foregroundColor(.green)
//            }
//            else if selectedCapital != "" {
//                Image(systemName: "xmark")
//                    .foregroundColor(.red)
//            }
//        }
//    }
//}
//
//
//struct MainView: View {
//    let capitals = ["", "Victoria", "Edmonton", "Regina", "Winnipeg"]
//    let provinces = ["", "BC", "AB", "SK", "MB"]
//    @State var selectedCapital = ""
//    @State var selectedProvince = ""
//
//    var body: some View {
//        TabView(selection: $selectedProvince) {
//            ForEach(1 ..< capitals.count) { // Warning: Evaluated only once
//                index in
//                PickerView(capitals: capitals, selectedProvince:
//                            provinces[index], correctAnswer: capitals[index])
//                .tabItem {
//                    Label(provinces[index], systemImage: "\(index).circle")
//                          }
//                        .tag(provinces[index])
//            }
//        }
//    }
//}
//}


///Question 54, Nav with two sliders, moves an image around the screen
//struct SettingsView: View {
//	@Binding var x: Double
//	@Binding var y: Double
//	var body: some View {
//		VStack {
//			HStack {
//				Text("X:")
//				Slider(value: $x, in: 0...UIScreen.main.bounds.width, step: 1)
//			}
//			HStack {
//				Text("Y:")
//				Slider(value: Binding(get: {y}, set: { newValue in y = newValue}), in: 0...UIScreen.main.bounds.height, step: 1)
//			}
//		}
//		.padding()
//	}
//}
//
//
//struct MainView: View {
//	@State private var showSettings = false
//	@State private var xLoc: Double = 150.0
//	@State private var yLoc: Double = 150.0
//	var body: some View {
//		NavigationView {
//			VStack {
//				if (showSettings) {
//					SettingsView(x: $xLoc, y: $yLoc)
//				}
//				else {
//					VStack {
//						Image(systemName: "car")
//							.resizable()
//							.aspectRatio(contentMode: .fit)
//							.frame(width: 100, height: 100)
//							.position(x: CGFloat(xLoc), y: CGFloat(yLoc))
//					}
//				}
//			}
//			.toolbar {
//				Button(action: {
//					showSettings.toggle()
//				}, label: {
//					Image(systemName: showSettings ? "house" : "gear")
//				})
//			}
//		}
//	}
//}


///Question 52, Toggle & Colour Picker, if toggle is true, adds a border around Text in MainView.
///
//struct SettingsView: View {
//	@Binding var isFav: Bool
//	@Binding var favColor: Color
//	var body: some View {
//		VStack {
//			Toggle(isOn: $isFav, label: {
//				Text("Show Border")
//			})
//			ColorPicker(selection: $favColor, label: {
//				Text("Colour")
//			})
//		}
//		.padding()
//	}
//}
//struct MainView: View {
//	@State private var showSettings: Bool = false
//	@State private var isFav: Bool = false
//	@State private var favColor: Color = .green
//	var body: some View {
//		NavigationStack {
//			VStack {
//				if (showSettings)
//				{
//					SettingsView(isFav: $isFav, favColor: $favColor)
//				}
//				else {
//					if (isFav)
//					{
//						Text("ICS224")
//							.border(favColor, width: 2)
//							.fontWeight(.bold)
//					}
//					else {
//						Text("ICS224")
//					}
//				}
//			}
//			.toolbar {
//				Button(action: {
//					showSettings.toggle()
//				}, label: {
//					Image(systemName: showSettings ? "house": "gear")
//				})
//			}
//		}
//	}
//}


#Preview{
	///needed if using @Model, otherwise preview will crash and you will have a bad time :(
	//MainView().modelContainer(for: InventoryItem.self).preferredColorScheme(.dark)
	MainView()
}
