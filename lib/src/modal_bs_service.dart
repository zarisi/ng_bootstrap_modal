import 'package:angular/angular.dart';
import 'package:bootstrap_modal/src/modal_component.dart';

// ignore: uri_has_not_been_generated
import 'package:bootstrap_modal/src/modal_component.template.dart' as modal;

///Service tath creates a modal in the DOM
@Injectable()
class ModalBsService {
  final ComponentLoader _loader;

  ModalBsService(this._loader);


  ///Creates a modal
  ///
  ///Creates a modal with a simple text content
  ModalBSComponent createSimpleModal(ViewContainerRef _location,
      {String header, bool dismissable: true, String content}) {
    ComponentRef componentRef = _loader.loadNextTo(
        modal.ModalBSComponentNgFactory);
    ModalBSComponent component = componentRef.instance;
    component.header = header;
    component.dismissable = dismissable;
    component.textContent = content;
    return component;
  }

  ///Creates a modal
  ///
  ///Creates a modal with a component as content
  ModalBSComponent createComponentModal(ViewContainerRef _location,
      ComponentFactory contentComponent,
      {String header, bool dismissable: true}) {
    ComponentRef componentRef = _loader.loadNextTo(
        modal.ModalBSComponentNgFactory);
    ModalBSComponent component = componentRef.instance;
    component.header = header;
    component.dismissable = dismissable;
    component.contentComponent = contentComponent;
    return component;
  }
}