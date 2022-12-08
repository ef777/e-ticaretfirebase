import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class Adetinput extends StatefulWidget {
  final int ilkadet, maxadet, minadet, artismikatri;
  final Function adetgetir;
  const Adetinput(
      {Key? key,
      this.artismikatri = 1,
      required this.ilkadet,
      required this.maxadet,
      required this.minadet,
      required this.adetgetir})
      : super(key: key);

  @override
  State<Adetinput> createState() => _AdetinputState();
}

class _AdetinputState extends State<Adetinput> {
  late int adet, artis = 1;
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    artis = widget.artismikatri;
    adet = widget.ilkadet;
    _controller = TextEditingController(text: adet.toString());
  }

  sayidegitir() {
    // ignore: unrelated_type_equality_checks, unnecessary_null_comparison
    if (adet == "" || adet == null) {
      adet = 1;
    }
    widget.adetgetir(adet);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        child: Row(
          children: [
            Expanded(
                child: IconButton(
                    onPressed: () {
                      adet != 0 ? adet = adet - artis : null;

                      setState(() {
                        _controller =
                            TextEditingController(text: adet.toString());
                      });
                      sayidegitir();
                    },
                    icon: const Icon(
                      FontAwesome.minus,
                      size: 14,
                    ))),
            Expanded(
              child: Container(
                  height: 34,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  alignment: Alignment.center,
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        int.parse(val) < 0 ? adet = 1 : adet = int.parse(val);
                      });
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                      ),
                      hintText: 'Mobile Number',
                    ),
                  )),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {
                    adet = adet + artis;
                    setState(() {
                      _controller =
                          TextEditingController(text: adet.toString());
                    });
                    sayidegitir();
                  },
                  icon: const Icon(
                    FontAwesome.plus,
                    size: 12,
                  )),
            )
          ],
        ));
  }
}
