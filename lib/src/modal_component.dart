import 'package:angular/angular.dart';

@Component(
  selector: 'modal-bs-component',
  templateUrl: 'modal_component.html',
  directives: const [
    CORE_DIRECTIVES
  ]
)
class ModalBSComponent {
@Input() String header;
@Input() bool dismissable = true;
@Input() String textContent;
}