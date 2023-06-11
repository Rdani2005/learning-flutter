import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:products_app/providers/providers.dart';
import 'package:products_app/services/product_services.dart';
import 'package:products_app/ui/input_decorations.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
        create: (_) =>
            ProductFormProvider(product: productsService.selectedProduct),
        child: _ProductScreenBody(productsService: productsService));
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    required this.productsService,
  });

  final ProductsService productsService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
        children: [
          Stack(
            children: [
              ProductImage(imageUrl: productsService.selectedProduct.picture),
              Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  )),
              Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final picker = ImagePicker();
                      final XFile? photo = await picker.pickImage(source: ImageSource.camera);

                      if (photo == null) {
                        
                      } else {
                        
                        productsService.UpdateSelectedProductImage(photo.path);
                      }
                    },
                  ))
            ],
          ),
          _ProductForm(
            provider: productForm,
          ),
          const SizedBox(
            height: 100,
          )
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: productsService.isSaving 
        ? null
        : () async {
          if (!productForm.isValid()) return;

          String? imageUrl = await productsService.uploadImage();

          if(imageUrl != null) {
            productForm.product.picture = imageUrl;
          }

          await productsService.saveOrCreateProduct(productForm.product);
        },
        child: productsService.isSaving ?
          const CircularProgressIndicator.adaptive()
         : const Icon(Icons.save_outlined),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  final ProductFormProvider provider;

  const _ProductForm({required this.provider});

  @override
  Widget build(BuildContext context) {
    final product = provider.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoDecoration(),
        child: Form(
            key: provider.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: product.name,
                  onChanged: (value) => product.name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El nombre es obligatorio";
                    }
                    return null;
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Nombre del producto', labelText: 'Nombre'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  initialValue: product.price.toString(),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    if (double.tryParse(value) == null) {
                      product.price = 0;
                      return;
                    }

                    product.price = double.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '\$ 150', labelText: 'Precio'),
                ),
                const SizedBox(
                  height: 30,
                ),
                SwitchListTile.adaptive(
                    title: const Text("Disponible"),
                    value: product.available,
                    onChanged: provider.updateAvailability),
                const SizedBox(
                  height: 30,
                ),
              ],
            )),
      ),
    );
  }

  BoxDecoration _buildBoDecoration() {
    return BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 5))
        ],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ));
  }
}


// FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))