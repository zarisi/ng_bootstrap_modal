import 'dart:async';
import 'package:angular/angular.dart';
import 'package:bootstrap_modal/src/modal_component.dart';

@Injectable()
class ModalBsService {
  final ComponentLoader _loader;
  final ComponentResolver _resolver;

  ModalBsService(this._loader, this._resolver);

  /**
   * Creates a modal
   *
   * Creates a modal with a simple text content
   */
  Future<ModalBSComponent> createSimpleModal(ViewContainerRef _location ,{String header, bool dismissable: true, String content}) async{
    return _resolver.resolveComponent(ModalBSComponent).then((ComponentFactory componentFactory){
      ComponentRef componentRef = _loader.loadNextTo(componentFactory);
      ModalBSComponent component = componentRef.instance;
      component.header = header;
      component.dismissable = dismissable;
      component.textContent = content;
      return component;
    });
  }

  Future<ModalBSComponent> createComponentModal(ViewContainerRef _location ,{String header, bool dismissable: true}) async{
    return _resolver.resolveComponent(ModalBSComponent).then((ComponentFactory componentFactory){
      ComponentRef componentRef = _loader.loadNextTo(componentFactory);
      ModalBSComponent component = componentRef.instance;
      component.header = header;
      component.dismissable = dismissable;
      return component;
    });
  }
}