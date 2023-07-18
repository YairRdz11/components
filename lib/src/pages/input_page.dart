import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _date = '';
  List<String> _superPowers = ['Volar', 'Rayos X', 'Super Aliento', 'Super fuerza'];
  String _optionSelected = 'Volar';
  var _nameCount = 0;
  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          const Divider(),
          _createPerson(),
          const Divider(),
          _createEmail(),
          const Divider(),
          _createPasword(),
          const Divider(),
          _createDate(context),
          const Divider(),
          _createDropdown()
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> GetOptionsDropDown() {
    List<DropdownMenuItem<String>> list = List.empty(growable: true);

    _superPowers.forEach((element) {
      list.add(DropdownMenuItem(child: Text(element), value: element));
    });

    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget> [
        const Icon(Icons.select_all),
        const SizedBox(width: 30.0,),
        DropdownButton(
          value: _optionSelected,
          items: GetOptionsDropDown(),
          onChanged: (value) {
            setState(() {
            _optionSelected = value!;
            });
          },
        )
      ],
    ) ;
  }
  
  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras $_nameCount'),
        hintText: 'Nombre persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle)
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
          _nameCount = _name.length;
        });
      },
    );
  }
  
  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_optionSelected),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email)
      ),
      onChanged: (value) => setState(() {
          _email = value;
        })
    );
  }

  Widget _createPasword() {
     return TextField(
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: const Icon(Icons.lock),
        icon: const Icon(Icons.lock)
      ),
      onChanged: (value) => setState(() {
          _email = value;
        })
    );
  }

  Widget _createDate(BuildContext context) {
     return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Birthdate',
        labelText: 'Birthdate',
        suffixIcon: const Icon(Icons.perm_contact_calendar),
        icon: const Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async{
    var picked = await showDatePicker(
      context: context, 
      initialDate:  DateTime.now(), 
      firstDate:  DateTime(2018), 
      lastDate:  DateTime(2025),
      locale: Locale('es', 'MX')
    );
    
    if(picked != null){
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }
}