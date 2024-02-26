import React from 'react';
import { StyleSheet, View, TouchableOpacity, Text, Image } from 'react-native';
import { useNavigation } from '@react-navigation/native'; // Importe useNavigation
import { LinearGradient } from 'expo-linear-gradient';

export default function HeaderProfile() {
  const navigation = useNavigation(); // Obtenha o objeto de navegação

  const handleOpenDrawer = () => {
    navigation.openDrawer(); // Abra o Drawer
  };

  return (
    <View style={styles.container}>
      <LinearGradient
        // Background Linear Gradient 
        colors={['rgba(0,55,104,1)', 'transparent']}
        style={styles.background}
      />
      <View style={styles.containerProfile}>
        <View style={styles.containerProfileTexts}>
          <Text className="text-white font-medium text-lg">Olá Tiago,</Text>
          <Text className="text-sm text-sky-200 -mt-1 mb-2">Tempo limpo, 23º</Text>
        </View>
        <TouchableOpacity style={styles.photoAvatar} onPress={handleOpenDrawer}>
          <View style={styles.avatar}>
            <Image
              source={require("../../assets/thiago-perfil.png")} // Substitua pelo caminho da sua imagem
              style={styles.avatar}
              resizeMode="contain"
            />
          </View>
        </TouchableOpacity>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    position: 'absolute',
    width: '100%',
    height: 220,
    alignItems: 'flex-end',
    justifyContent: 'center',
    gap: 10,
    top: -13,
    left: 0,
    zIndex: 2000,
    paddingHorizontal: 5,
  },
  background: {
    position: 'absolute',
    left: 0,
    right: 0,
    top: 0,
    height: 400,
    height: '120%',
  },
  containerProfile: {
    padding: 15,
    flexDirection: 'row',
    gap: 10
  },
  containerProfileTexts: {
    alignItems: 'flex-end',
    justifyContent: 'center',
  },
  textName: {
    fontSize: 20,
    color: '#fff',
    marginTop: -5
  },
  textClima: {
    fontSize: 15,
    color: '#DCEBF3',
  },
  photoAvatar: {
    width: 45,
    height: 45,
    backgroundColor: '#2887DF',
    borderRadius: 100,
    alignItems: 'center',
    justifyContent: 'center'
  },
  avatar: {
    width: 39,
    height: 39,
    backgroundColor: '#fff',
    borderRadius: 100
  }
});
