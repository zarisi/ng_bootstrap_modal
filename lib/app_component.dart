// Copyright (c) 2017, iblasco. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'package:bootstrap_modal/src/modal_bs_service.dart';
import 'src/todo_list/todo_list_component.dart';
import 'src/modal_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, TodoListComponent],
  providers: const [materialProviders, ModalBsService],
)
class AppComponent implements AfterViewInit{
  final SlowComponentLoader _loader;
  final ViewContainerRef _location;
  final ModalBsService _modalService;

  AppComponent(this._loader, this._location, this._modalService);

  @override
  ngAfterViewInit() async{
    _modalService.createSimpleModal(_location,header: "Esta es la cabecera",content: "Este es el contenido del modal");
  }
}
