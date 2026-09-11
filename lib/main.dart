import 'package:flutter/material.dart';

class Incidente {
  final String id;
  final String titulo;
  final String tipo;
  final String severidade;
  final String status;
  final DateTime abertoEm;
  final String? responsavel;

  const Incidente({
    required this.id,
    required this.titulo,
    required this.tipo,
    required this.severidade,
    required this.status,
    required this.abertoEm,
    this.responsavel,
  });

  String get abertoHa {
    final decorrido = DateTime.now().difference(abertoEm);
    if (decorrido.inMinutes < 60) {
      return 'há ${decorrido.inMinutes}min';
    }
    if (decorrido.inHours < 24) {
      return 'há ${decorrido.inHours}h';
    }
    final dias = decorrido.inDays;
    return dias == 1 ? 'há 1 dia' : 'há $dias dias';
  }
}

IconData iconeDaSeveridade(String severidade) {
  switch (severidade) {
    case 'Crítico':
      return Icons.report;
    case 'Alto':
      return Icons.warning;
    case 'Médio':
      return Icons.info;
    default:
      return Icons.low_priority;
  }
}

class IncidenteCard extends StatelessWidget {
  final Incidente incidente;

  const IncidenteCard({super.key, required this.incidente});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(iconeDaSeveridade(incidente.severidade)),
                const SizedBox(width: 8),
                Text(incidente.titulo),
              ],
            ),
            const SizedBox(height: 4),
            Text('#${incidente.id} · ${incidente.tipo}'),
            const SizedBox(height: 4),
            Text('Severidade: ${incidente.severidade}'),
            Text('Status: ${incidente.status}'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(incidente.responsavel ?? 'Sem responsável'),
                Text(incidente.abertoHa),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final agora = DateTime.now();

final List<Incidente> incidentes = [
  Incidente(
    id: 'INC-1045',
    titulo: 'Login falho repetido — conta admin',
    tipo: 'Acesso não autorizado',
    severidade: 'Crítico',
    status: 'Aberto',
    abertoEm: agora.subtract(const Duration(minutes: 15)),
  ),
  Incidente(
    id: 'INC-1044',
    titulo: 'Acesso fora do horário — VPN corporativa',
    tipo: 'Acesso não autorizado',
    severidade: 'Crítico',
    status: 'Aberto',
    abertoEm: agora.subtract(const Duration(minutes: 40)),
    responsavel: 'Ana Souza',
  ),
  Incidente(
    id: 'INC-1042',
    titulo: 'Tentativa de phishing — portal de RH',
    tipo: 'Phishing',
    severidade: 'Alto',
    status: 'Em andamento',
    abertoEm: agora.subtract(const Duration(hours: 3)),
    responsavel: 'Ana Souza',
  ),
  Incidente(
    id: 'INC-1039',
    titulo: 'Malware detectado — estação FIN-07',
    tipo: 'Malware',
    severidade: 'Alto',
    status: 'Em andamento',
    abertoEm: agora.subtract(const Duration(days: 1, hours: 2)),
    responsavel: 'Carlos Lima',
  ),
  Incidente(
    id: 'INC-1031',
    titulo: 'Picos de tráfego — API pública',
    tipo: 'DDoS',
    severidade: 'Médio',
    status: 'Resolvido',
    abertoEm: agora.subtract(const Duration(days: 2, hours: 5)),
    responsavel: 'Ana Souza',
  ),
  Incidente(
    id: 'INC-1027',
    titulo: 'Certificado TLS expirado — intranet',
    tipo: 'Outro',
    severidade: 'Baixo',
    status: 'Resolvido',
    abertoEm: agora.subtract(const Duration(days: 4)),
    responsavel: 'Carlos Lima',
  ),
];

void main() {
  runApp(
    MaterialApp(
      title: 'Central de Incidentes',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: const Text('Central de Incidentes'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: incidentes
              .map((incidente) => IncidenteCard(incidente: incidente))
              .toList(),
        ),
      ),
    ),
  );
}
