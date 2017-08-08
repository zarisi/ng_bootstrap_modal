import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';


///Modal component for ng_bootstrap
@Component(
    selector: 'modal-bs-component',
    templateUrl: 'modal_component.html',
    directives: const [
      CORE_DIRECTIVES
    ]
)
class ModalBSComponent implements OnDestroy{
  ///The header
  @Input() String header;
  ///Bootstrap modal backdrop
  @Input() bool backdrop = true;
  ///Show modal dismissable button
  @Input() bool dismissable = true;
  ///Content as string
  @Input() String textContent;
  ///Show modal
  @Input() bool show = false;
  ///Accept button
  @Input() CustomButton acceptButton;
  ///Cancel button
  @Input() CustomButton cancelButton;
  ///List of all custom buttons
  @Input() List<CustomButton> customButtons = [];
  ///Content as a component
  @Input() ComponentFactory contentComponent;
  ///Checks if the content is already loaded
  bool _contentLoaded = false;
  ///Stream tath controll all the button inputs
  StreamController _controller = new StreamController();
  ///Returns the stream to listen
  Stream get buttonStream => _controller.stream;
  ///Location to place contentComponent
  @ViewChild('contentComponent', read: ViewContainerRef)
  ViewContainerRef contentComponentLocation;

  ///Hides the modal
  void close() {
    show = false;
  }

  ///Show the modal
  void open() {
    show = true;
    if (contentComponent != null && !_contentLoaded){
      contentComponentLocation.loadNextToLocation(
          contentComponent, contentComponentLocation);
      _contentLoaded = true;
    }
  }

  ///Adds the cancel button to the modal
  addCancel(
      {String label: "Cancel", String id: "cancelModal", String classes: "btn-secondary"}) {
    cancelButton = new CustomButton(label, id, classes);
  }

  ///Adds the accept button to the modal
  addAccept(
      {String label: "Accept", String id: "acceptModal", String classes: "btn-primary"}) {
    acceptButton = new CustomButton(label, id, classes);
  }

  ///Adds a custom button to the modal
  addCustomButton(label, id, {String classes: "btn-secondary"}) {
    customButtons.add(new CustomButton(label, id, classes));
  }

  ///Adds an action to the stream
  action(MouseEvent e) {
    Element target = e.target;
    _controller.add(target.id);
  }

  @override
  ngOnDestroy() {
    _controller.close();
  }
}

///Simple class to save all the modal button variables
class CustomButton {
  String label;
  String id;
  String classes;

  CustomButton(this.label, this.id, this.classes);
}