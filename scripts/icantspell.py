#!/usr/bin/env python3

import asyncio
import tkinter as tk
from tkinter import font

import aiohttp
import pyperclip
from autocorrect import Speller
from wiktionaryparser import WiktionaryParser


class Root(tk.Tk):
    def __init__(self):
        super().__init__()
        self.spell = Speller()
        self.defs = WiktionaryParser()

        self.title("icantspell")
        self.geometry("700x200")
        self.call('tk', 'scaling', 0.7)
        self.bind("<Escape>", lambda _: self.destroy())
        self.bind("<Return>", lambda _: self.copy_word())
        
        self.configure(highlightthickness=0, background="#282C33")

        self.search_bar_text = tk.StringVar(self, "", "search_bar")
        self.search_bar_text.trace('w', self.do_query)
        self.search_bar = tk.Entry(master=self, textvariable=self.search_bar_text)
        self.search_bar.configure(
            relief="flat",
            font=font.Font(family="FiraCode Nerd Font Mono", size=20, weight="normal"),
            foreground="#8ca0aa",
            background="#2e343f",
            highlightthickness=0,
            insertbackground="#8ca0aa",
            borderwidth=15)
        self.search_bar.pack(side=tk.TOP, fill=tk.X)
        self.search_bar.focus_set()

        self.entry_list_text = tk.StringVar(self, "", "entry_list")
        self.entry_list = tk.Label(self, textvariable=self.entry_list_text)
        self.entry_list.configure( \
            relief="flat",
            font=font.Font(family="FiraCode Nerd Font Mono", size=24, weight="bold"),
            foreground="#8ca0aa",
            background="#282C33",
            highlightthickness=0,
            borderwidth=15)
        self.entry_list.pack(side=tk.TOP, anchor=tk.NW)

        self.def_elem_text = tk.StringVar(self, "", "word_def")
        self.def_elem = tk.Label(self, textvariable=self.def_elem_text)
        self.def_elem.configure( \
            relief="flat",
            font=font.Font(family="FiraCode Nerd Font Mono", size=24, weight="normal"),
            foreground="#8ca0aa",
            background="#282C33",
            highlightthickness=0,
            borderwidth=15)
        self.def_elem.pack(side=tk.BOTTOM, anchor=tk.NW)

    def do_query(self, *args):
        corrected_word = self.spell(self.search_bar_text.get().replace(" ", ""))

        self.entry_list_text.set(corrected_word)
        self.entry_list.pack(side=tk.TOP, anchor=tk.NW)

        #asyncio.run(self.get_def(corrected_word))

    async def get_def(self, word):
        word_def = await self.api_fetch(word)

        self.def_elem_text.set(word_def)
        self.def_elem.pack(side=tk.BOTTOM, anchor=tk.NW)

    async def api_fetch(self, word):
        return self.defs.fetch(word)

    def copy_word(self):
        word = self.entry_list_text.get()
        if word != "" and not(word is None):
            pyperclip.copy(word)
            self.destroy()

if __name__ == "__main__":
    root = Root()
    root.mainloop()
