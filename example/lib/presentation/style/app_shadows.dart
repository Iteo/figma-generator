import 'package:flutter/material.dart';


class AppShadows {
const AppShadows._();


static Map<String, BoxShadow> get allShadows => {
"divider": divider,
"shadowFromDown": shadowFromDown,
"shadowFromUp": shadowFromUp,
};


static const BoxShadow divider = BoxShadow(blurRadius: 1,
spreadRadius: 0,
color: Color(0x0D000000),
offset:  Offset(0, 1),
);

static const BoxShadow shadowFromDown = BoxShadow(blurRadius: 16,
spreadRadius: 0,
color: Color(0x1A000000),
offset:  Offset(0, 8),
);

static const BoxShadow shadowFromUp = BoxShadow(blurRadius: 16,
spreadRadius: 0,
color: Color(0x05000000),
offset:  Offset(0, -8),
);


}
