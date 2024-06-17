import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/componentes/produto_item_list.dart';
import 'package:quitanda/vm/carrinho.dart';
import 'package:quitanda/vm/catalogo.dart';

class CatalagoView extends StatelessWidget {
  final String categoria;

  const CatalagoView({
    super.key,
    required this.categoria,
  });

  @override
  Widget build(BuildContext context) {
    //na linha abaixo a gente esta pedindo um catalogo gerenciado
    //para o provider. A partir de agora, toda mudança no Catalogo
    //vai causar uma atualização aqui
    final catalogo = Provider.of<Catalogo>(context);
    final produtos = catalogo.findByCategoria(categoria);

    return Container(
      padding: const EdgeInsets.all(8),
      child: ListView.separated(
        itemCount: produtos.length,
        itemBuilder: (context, index) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pushNamed(
            context,
            "/detail",
            arguments: catalogo.produtos[index].id,
          ),
          child: ProdutoItemList(
            produto: catalogo.produtos[index],
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
