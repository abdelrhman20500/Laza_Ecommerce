import 'package:flutter/material.dart';

class BuildItemCart extends StatelessWidget {
  const BuildItemCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.blueGrey),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: const Image(
                  image: AssetImage("assets/images/shirt.png"),
                  fit: BoxFit.fill,
                  height: 150,
                  width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Power workout tee",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "\$3000",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_up,
                              size: 32,
                            )),
                        const Text(
                          "1",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 32,
                            )),
                        const SizedBox(
                          width: 22,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_outlined,
                              size: 35,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
